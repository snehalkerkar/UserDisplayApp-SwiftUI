//
//  AppError.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 21/07/23.
//

import Foundation

/// Enum to define app errors
enum AppError: Int, Error {
	case api
	case network
	case technical
	case timeout
	case unknown

	case missingPassword = 400
}
