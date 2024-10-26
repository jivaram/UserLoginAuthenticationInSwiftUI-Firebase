//
//  LoginView.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("NatureImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 100)
                    .cornerRadius(12)
                    .clipped()
                    .padding(.vertical, 32)
                
                // login field
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "Enter your email")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button(action: {
                    print("User log in...")
                }, label: {
                    HStack{
                        Text("Sign in")
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
                
                //sign up
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}

#Preview {
    LoginView()
}
