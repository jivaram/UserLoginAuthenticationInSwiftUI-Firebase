//
//  AuthenticationViewModel.swift
//  UserLoginAuthenticationInSwiftUI+Firebase
//
//  Created by Jiva Ram on 25/09/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol{
    var formIsValid: Bool { get }
}

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            do {
                try await fetchUser()
            } catch {
                print("something went wrong..")
            }
        }
    }
    
    func userSignIn(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            print("result: \(result)")
            self.userSession = result.user
            await fetchUser()
            print("sign in..")
        } catch {
            print("failed to sign in with \(error.localizedDescription)")
        }
    }
    
    func createUserAccount(withEmail: String, password: String, fullName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: withEmail)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("user").document(user.id).setData(encodedUser)
            await fetchUser()
            print("create account..")
        } catch{
            print("Debug: failed to creat new user with error: \(error.localizedDescription)")
        }
        print("create account..")
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut() //sign out user from backend
            self.currentUser = nil //wipes out to current user data model
            self.userSession = nil // //wipes out user session sesson and take back to login screen
            print("sign out..")
        }catch{
            print("Failed to sign out with \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        do{
            try Auth.auth().currentUser?.delete() // delete from the backend
            self.currentUser = nil //wipes out to current user data model
            self.userSession = nil // //wipes out user session sesson and take back to login screen
            print("delete out..")
        }catch{
            print("delete account failed with \(error.localizedDescription)")
        }
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("user").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("Debug: cureent user is: \(self.currentUser)")
    }
    
}

