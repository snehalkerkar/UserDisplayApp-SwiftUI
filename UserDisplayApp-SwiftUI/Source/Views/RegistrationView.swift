//
//  RegistrationView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct RegistrationView: View {

	@State var name = ""
	@State var email = ""
	@State var password = ""
	@State var confirmPassword = ""

	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var viewModel: UserServiceViewModel

    var body: some View {
		ZStack {
			VStack {
				Text("SIGN UP")
					.font(.title)
					.fontWeight(.bold)
					.padding(.vertical, 35)

				InputView(
					inputText: $name,
					title: "Full Name",
					placeholder: "Enter your full name"
				)

				InputView(
					inputText: $email,
					title: "Email ID",
					placeholder: "Enter your email id"
				)
				.textInputAutocapitalization(.never)
				.padding(.top, 25)

				InputView(
					inputText: $password,
					title: "Password",
					placeholder: "Enter your password",
					isSecureField: true
				)
				.padding(.top, 25)

				InputView(
					inputText: $confirmPassword,
					title: "Confirm Password",
					placeholder: "Re-enter your password",
					isSecureField: true
				)
				.padding(.top, 25)

				Text(viewModel.errorMessage)
					.font(.footnote)
					.foregroundColor(.red)
					.opacity(viewModel.showError ? 1 : 0)

				ButtonView(title: "REGISTER") {
					Task {
						self.viewModel.register(
							request: LogInRequest(email: email, password: password)
						)
					}
				}
				.padding(.top, 35)

				Spacer()

				// Log In
				Button {
					dismiss()
				} label: {
					HStack {
						Text("Already registered?")
							.foregroundColor(Color.black.opacity(0.7))
						Text("LOG IN")
							.fontWeight(.semibold)
							.underline()
					}
				}
			}
			.padding()
		}
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
			.environmentObject(UserServiceViewModel(networkManager: NetworkManager()))
    }
}
