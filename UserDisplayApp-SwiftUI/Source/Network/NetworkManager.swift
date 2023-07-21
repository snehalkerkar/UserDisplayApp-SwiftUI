//
//  NetworkManager.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 21/07/23.
//

import Foundation

/// This is protocol class for NetworkManagerProtocol
protocol NetworkManagerProtocol {
	typealias DataTaskResult = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

	/// Data task request
	/// - Parameters:
	///   - urlRequest: urlRequest
	///   - completion: completion block with response data and error
	func request(urlRequest: URLRequest, completion: @escaping DataTaskResult) throws

	/// Download task request
	/// - Parameters:
	///   - url: request url from which data will be downloaded
	///   - completion: completion block with response data and error
	func download(url: URL, completion: @escaping DataTaskResult) throws
}

// MARK: - NetworkManagerProtocol

final class NetworkManager: NSObject, NetworkManagerProtocol {

	func request(urlRequest: URLRequest, completion: @escaping DataTaskResult) throws {
		URLSession.shared.dataTask(with: urlRequest, completionHandler: completion).resume()
	}

	func download(url: URL, completion: @escaping DataTaskResult) throws {
		URLSession.shared.downloadTask(
			with: URLRequest(url: url),
			completionHandler: { url, response, error in
				guard let certificateURL = url,
					  let certificateData = try? Data(contentsOf: certificateURL)
				else {
					return completion(nil, response, error)
				}
				completion(certificateData, response, error)
			}
		).resume()
	}
}
