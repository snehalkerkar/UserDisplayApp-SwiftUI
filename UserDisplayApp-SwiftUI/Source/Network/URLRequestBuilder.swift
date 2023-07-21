//
//  URLRequestBuilder.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 21/07/23.
//

import Foundation

/// Structure is being used to build the API request
struct URLRequestBuilder {

	private init() {}

	static func buildURLRequest(endpoint: Endpoint) throws -> URLRequest {
		guard var requestURL = endpoint.baseURL else {
			throw AppError.technical
		}

		if let path = endpoint.path {
			requestURL = requestURL.appendingPathComponent(path)
		}

		var request = URLRequest(url: requestURL)

		// Method
		request.httpMethod = endpoint.httpMethod.rawValue

		// Headers
		if let headers = endpoint.headers {
			request.allHTTPHeaderFields = headers
		}

		// JSON
		if let json = endpoint.jsonParameters {
			request.httpBody = try JSONSerialization.data(withJSONObject: json)
			if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
				request.setValue(Constants.contentJSON, forHTTPHeaderField: Constants.kContentType)
			}
		}

		// URL encoded params
		if let urlParameters = endpoint.urlParameters {
			if var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false) {
				urlParameters.forEach { key, value in
					urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
				}
				request.url = urlComponents.url
			}
			if request.value(forHTTPHeaderField: Constants.kContentType) == nil {
				request.setValue(
					Constants.contentURLEncoded,
					forHTTPHeaderField: Constants.kContentType
				)
			}
		}
		return request
	}
}

