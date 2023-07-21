//
//  UserListView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct UsersView: View {

	@EnvironmentObject var viewModel: UserServiceViewModel

    var body: some View {
		NavigationStack {
			VStack {
				if viewModel.users.isEmpty {
					VStack {
						Image(systemName: "exclamationmark.icloud.fill")
							.resizable()
							.scaledToFit()
							.frame(width: 64.0, height: 64.0)
							.foregroundColor(.accentColor)
						Text("Ooops, No users around!")
							.font(.title2)
							.foregroundColor(.red)
					}
				} else {
					List(viewModel.users, id: \.id) { user in
						UserRowView(user: user)
					}
					.navigationTitle("Contacts")
					.toolbarColorScheme(.dark, for: .navigationBar)
					.toolbarBackground(AppColor.primary, for: .navigationBar)
					.toolbarBackground(.visible, for: .navigationBar)
				}
			}
		}
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
		UsersView()
			.environmentObject(UserServiceViewModel(networkManager: NetworkManager()))
    }
}
