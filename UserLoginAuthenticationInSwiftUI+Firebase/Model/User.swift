//
//  User.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let componemts  = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: componemts)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Jiva iOS", email: "jivarammac@gmail.com")
}
