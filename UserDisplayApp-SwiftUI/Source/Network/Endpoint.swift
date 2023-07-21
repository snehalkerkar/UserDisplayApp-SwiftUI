//
//  Endpoint.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 21/07/23.
//

import Foundation

/// Enum to define API request path
enum API: String {
	case register = "/api/register"
	case logIn = "/api/login"
	case listUsers = "/api/users"
}

/// Enum to define HTTP Methods
enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
}

typealias HTTPHeaders = [String: String]

/// Structure is used to setup url request parameters
struct Endpoint {
	var baseURL: URL? = URL(string: Constants.baseURL)
	var path: String?
	var jsonParameters: [String: Any]?
	var urlParameters: [String: String]?
	var headers: HTTPHeaders?
	var httpMethod: HTTPMethod
}


