//
//  SettingsRowView.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import SwiftUI

struct SettingsRowView: View {
    var imageName: String
    var title: String
    var tintColor: Color
    var body: some View {
        HStack {
            Image(systemName:imageName)
                .imageScale(.small)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColor: .gray)
}
