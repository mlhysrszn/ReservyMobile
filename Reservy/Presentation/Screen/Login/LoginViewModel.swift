//
//  LoginViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 27.05.2024.
//

import SwiftUI

@MainActor class LoginViewModel: ObservableObject {
    private var userDefaults = UserDefaultsManager.shared
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func login() async {
        guard validateFields() else { return }
        isLoading = true
        
        let loginRequest = LoginRequest(
            email: email,
            password: password
        )
        
        do {
            let requestBody = try? JSONEncoder().encode(loginRequest)
            
            let _: BaseResponse<User> = try await NetworkManager.shared.post(
                endpoint: Endpoint.login,
                body: requestBody,
                responseType: BaseResponse<User>.self
            )
            userDefaults.isUserLoggedIn = true
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    private func validateFields() -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields correctly."
            return false
        }
        return true
    }
}
