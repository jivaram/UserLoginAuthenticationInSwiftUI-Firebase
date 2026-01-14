//
//  ProfileView.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List {
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStackLayout(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                        print("sign out here...")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.red))
                    }
                    
                    Button {
                        viewModel.deleteAccount()
                        print("Delete account here...")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
