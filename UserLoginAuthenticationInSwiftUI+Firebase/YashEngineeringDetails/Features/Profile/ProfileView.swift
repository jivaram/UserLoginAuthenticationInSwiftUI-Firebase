//
//  ProfileView.swift
//  YashEngineering
//
//  Created by Jiva Ram on 24/05/25.
//

import SwiftUI

struct ProfileView: View {
    // Example user data
    let name = "Jiva Ram"
    let gender = "Male"
    let dob = "05 Oct 1998"
    let phone = "+91 8218916708"
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            // Edit button at top right
            HStack {
                Spacer()
                Button(action: {
                    // Handle edit profile
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "pencil")
                        Text("Edit")
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            // Profile Card
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.blue)
                    .padding(.top, 16)
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                profileRow(icon: "person.fill", label: "Gender", value: gender)
                profileRow(icon: "calendar", label: "Date of Birth", value: dob)
                profileRow(icon: "phone.fill", label: "Phone", value: phone)
            }
            .padding()
            .background(Color(.systemBackground).opacity(0.9))
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Spacer()
            
            // Action Buttons
            VStack(spacing: 16) {
                Button(action: {
                    // Handle logout
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Logout")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                
                Button(action: {
                    // Handle delete account
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete Account")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color("primary").ignoresSafeArea())
    }
    
    // Helper for profile rows
    @ViewBuilder
    func profileRow(icon: String, label: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            Text(label + ":")
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ProfileView()
}
