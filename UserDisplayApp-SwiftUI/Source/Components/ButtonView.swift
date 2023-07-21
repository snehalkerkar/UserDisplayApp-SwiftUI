//
//  ButtonView.swift
//  UserDisplayApp-SwiftUI
//
//  Created by Snehal Kerkar on 20/07/23.
//

import SwiftUI

struct ButtonView: View {
	let title: String
	let action: () -> Void

    var body: some View {
		VStack(alignment: .leading) {
			Button(title, action: action)
			.fontWeight(.bold)
			.font(.title3)
			.frame(width: UIScreen.main.bounds.width - 30, height: 44)
			.background(AppColor.primary)
			.foregroundColor(.white)
			.cornerRadius(10)
		}
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
		ButtonView(title: "", action: {})
    }
}
