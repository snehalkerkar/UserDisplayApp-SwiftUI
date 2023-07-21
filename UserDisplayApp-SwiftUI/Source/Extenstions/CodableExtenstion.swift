//
//  CodableExtenstion.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 21/07/23.
//

import Foundation

extension Encodable {
	var dictionary: [String: Any]? {
		guard let data = try? JSONEncoder().encode(self) else { return nil }
		return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
			.flatMap { $0 as? [String: Any] }
	}
}

extension Data {
	func decode<T: Decodable>(type: T.Type) -> T? {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return try? decoder.decode(type, from: self)
	}
}
