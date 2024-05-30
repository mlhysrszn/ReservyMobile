//
//  RegisterViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation
import SwiftUI

@MainActor
class RegisterViewModel: ObservableObject {
    private var userDefaults = UserDefaultsManager.shared
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var secondPassword: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func register() async {
        guard validateFields() else { return }
        isLoading = true
        
        let registerRequest = RegisterRequest(
            firstname: firstName,
            lastname: lastName,
            email: email,
            phoneNumber: phoneNumber,
            password: password
        )
        
        do {
            let requestBody = try? JSONEncoder().encode(registerRequest)
            
            let _: BaseResponse<User> = try await NetworkManager.shared.post(
                endpoint: Endpoint.register,
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
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !phoneNumber.isEmpty, !password.isEmpty, password == secondPassword else {
            errorMessage = "Please fill in all fields correctly."
            return false
        }
        return true
    }
}

