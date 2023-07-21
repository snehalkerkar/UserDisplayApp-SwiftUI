//
//  User.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import Foundation

struct LogInRequest: Codable {
	var email: String?
	var password: String?
}

struct LogInResponse: Decodable {
	var id: Int?
	var token: String
}

struct LogInErrorResponse: Decodable {
	var error: String
}

struct Support: Decodable {
	let url: String
	let text: String
}

struct UserMetaData: Decodable {
	let page: Int
	let perPage: Int
	let total: Int
	let totalPages: Int
	let data: [User]
	let support: Support
}

struct User: Decodable {
	let id: Int
	let email: String?
	let firstName: String?
	let lastName: String?
	let avatar: String?
}
