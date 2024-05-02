//
//  AuthManager.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import Foundation
import FirebaseAuth

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    
    @Published var isUserSignedIn: Bool = false
    
    init() {
        auth.addStateDidChangeListener { auth, user in
            if user != nil {
                self.isUserSignedIn = true
            } else {
                self.isUserSignedIn = false
            }
        }
    }
    
    func signIn(email: String, password: String) async throws -> Void {
        do {
            try await auth.signIn(withEmail: email, password: password)
            await MainActor.run {
                isUserSignedIn = true
            }
        } catch {
            throw error
        }
    }
    
    func signUp(firstName: String, lastName: String, email: String, phoneNumber: String, password: String) async throws -> Void {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            let changeRequest = result.user.createProfileChangeRequest()
            changeRequest.displayName = "\(firstName) \(lastName)"
            try await changeRequest.commitChanges()
            isUserSignedIn = true
        } catch {
            throw error
        }
    }
    
    func signOut() async throws {
        do {
            try auth.signOut()
            await MainActor.run {
                isUserSignedIn = false
            }
        } catch {
            throw error
        }
    }
}
