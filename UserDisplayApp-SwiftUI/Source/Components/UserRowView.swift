//
//  UserRowView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct UserRowView: View {

	let user: User

    var body: some View {
		HStack {
			AsyncImage(url: URL(string: user.avatar ?? "")) { image in
				image
					.resizable()
					.scaledToFill()
			} placeholder: {
				Color.gray.opacity(0.1)
			}
			.frame(width: 104)
			.padding(-10)
			.padding(.leading, -8)
			.padding(.trailing, 12)

			VStack(alignment: .leading, spacing: 5) {
				Text("\(user.firstName ?? "") \(user.lastName ?? "")")
				Text(user.email ?? "")
					.foregroundColor(Color.black.opacity(0.7))
			}
			.padding(.horizontal, 8)

			Spacer()

			Circle()
				.frame(maxWidth: 15, maxHeight: 15)
				.foregroundColor(Color(red: 0, green: 202/255, blue: 167/255))
				.padding()
		}
		.frame(height: 104)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
		UserRowView(user: User(
			id: 7,
			email: "michael.lawson@reqres.in",
			firstName: "Michael",
			lastName: "Lawson",
			avatar: "https://reqres.in/img/faces/7-image.jpg"
		))
    }
}
