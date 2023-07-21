//
//  LoginView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct LoginView: View {

	@EnvironmentObject var viewModel: UserServiceViewModel

	@State var email = ""
	@State var password = ""

    var body: some View {
		NavigationStack {

			VStack(alignment: .leading) {
				Text("Welcome,")
					.font(.largeTitle)
					.fontWeight(.bold)
					.padding(.vertical, 35)
			}

			VStack {
				InputView(
					inputText: $email,
					title: "Email ID",
					placeholder: "Enter your email id"
				)
				.textInputAutocapitalization(.never)

				InputView(
					inputText: $password,
					title: "Password",
					placeholder: "Enter your password",
					isSecureField: true
				)
				.padding(.top, 25)

				Text(viewModel.errorMessage)
					.font(.footnote)
					.foregroundColor(.red)
					.opacity(viewModel.showError ? 1 : 0)

				ButtonView(title: "LOG IN") {
					viewModel.logIn(request: LogInRequest(email: email, password: password))
				}
				.padding(.top, 35)
			}
			.padding()

			Spacer()

			// Register
			NavigationLink {
				RegistrationView()
					.navigationBarHidden(true)
			} label: {
				HStack {
					Text("Haven't registered yet?")
						.foregroundColor(Color.black.opacity(0.7))
					Text("REGISTER")
						.fontWeight(.semibold)
						.underline()
				}
			}
		}
		.navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		LoginView().environmentObject(UserServiceViewModel(networkManager: NetworkManager()))
    }
}
