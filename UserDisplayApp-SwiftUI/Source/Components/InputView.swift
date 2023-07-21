//
//  InputView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct InputView: View {
	@Binding var inputText: String

	let title: String
	let placeholder: String
	var isSecureField = false

    var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.fontWeight(.semibold)

			if isSecureField {
				SecureField(placeholder, text: $inputText)
			} else {
				TextField(placeholder, text: $inputText)
			}

			Divider()
		}
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
		InputView(inputText: .constant(""), title: "Email", placeholder: "Enter your email")
    }
}
