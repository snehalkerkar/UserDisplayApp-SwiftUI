//
//  UserServiceViewModel.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import Foundation

@MainActor
final class UserServiceViewModel: ObservableObject {
	@Published var users = [User]()
	@Published var errorMessage = "Unknown Error"
	@Published var showError = false

	private let networkManager: NetworkManagerProtocol

	init(networkManager: NetworkManagerProtocol) {
		self.networkManager = networkManager
	}

	func register(request: LogInRequest) {
		let endpoint = Endpoint(
			path: API.register.rawValue,
			jsonParameters: request.dictionary,
			httpMethod: .post
		)
		do {
			let urlRequest = try URLRequestBuilder.buildURLRequest(endpoint: endpoint)
			try networkManager.request(urlRequest: urlRequest) { data, response, error in
				self.parseLogInResponse(data: data, response: response as? HTTPURLResponse)
			}
		} catch {
			showError = true
		}
	}

	func logIn(request: LogInRequest) {
		let endpoint = Endpoint(
			path: API.logIn.rawValue,
			jsonParameters: request.dictionary,
			httpMethod: .post
		)
		do {
			let urlRequest = try URLRequestBuilder.buildURLRequest(endpoint: endpoint)
			try networkManager.request(urlRequest: urlRequest) { data, response, error in
				self.parseLogInResponse(data: data, response: response as? HTTPURLResponse)
			}
		} catch {
			showError = true
		}
	}

	func fetchUsers() {
		let endpoint = Endpoint(path: API.listUsers.rawValue, httpMethod: .get)
		do {
			let urlRequest = try URLRequestBuilder.buildURLRequest(endpoint: endpoint)
			try networkManager.request(urlRequest: urlRequest) { data, response, error in
				self.parseUserResponse(response: response as? HTTPURLResponse, data: data)
			}
		} catch {
			showError = true
		}
	}
}

extension UserServiceViewModel {

	func parseLogInResponse(data: Data?, response: HTTPURLResponse?) {
		if response?.statusCode == Constants.statusOK,
		   let data, let token = data.decode(type: LogInResponse.self)?.token {
			print("User login token - \(token)")
			fetchUsers()
		} else if response?.statusCode == AppError.missingPassword.rawValue, let data {
			guard let error = data.decode(type: LogInErrorResponse.self)?.error else {
				showError = true
				return
			}
			DispatchQueue.main.async {
				self.showError = true
				self.errorMessage = error
			}
		} else {
			showError = true
		}
	}
	
	func parseUserResponse(response: HTTPURLResponse?, data: Data?) {
		var users = [User]()
		if response?.statusCode == Constants.statusOK, let data {
			users = data.decode(type: UserMetaData.self)?.data ?? []
		}
		DispatchQueue.main.async {
			self.users = users
		}
	}
}


