//
//  ContentView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct ContentView: View {

	@EnvironmentObject var viewModel: UserServiceViewModel

    var body: some View {
		Group {
			if viewModel.users.isEmpty {
				LoginView()
			} else {
				UsersView()
					.navigationBarHidden(false)
					.navigationTitle("Contacts")
					.navigationBarTitleDisplayMode(.large)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(UserServiceViewModel(networkManager: NetworkManager()))
    }
}
