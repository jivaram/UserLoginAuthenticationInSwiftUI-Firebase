//
//  RegistrationView.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismissView
    var body: some View {
        VStack {
            Image("NatureImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 100)
                .cornerRadius(12)
                .clipped()
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "Enter your email")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                InputView(text: $fullName, title: "Full Name", placeholder: "Enter your name")
                    .autocapitalization(.none)

                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                InputView(text: $confirmPassword, title: "Confirm password", placeholder: "confirm password", isSecureField: true)

            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button(action: {
                print("User sign up...")
            }, label: {
                HStack{
                    Text("Sign up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            })
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismissView()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }

        }
    }
}

#Preview {
    RegistrationView()
}
