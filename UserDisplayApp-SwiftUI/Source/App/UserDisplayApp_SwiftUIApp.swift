//
//  UserDisplayApp_SwiftUIApp.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

@main
struct UserDisplayApp_SwiftUIApp: App {

	@StateObject private var viewModel = UserServiceViewModel(networkManager: NetworkManager())

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(viewModel)
        }
    }
}
