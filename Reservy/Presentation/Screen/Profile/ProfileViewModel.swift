//
//  ProfileViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 30.05.2024.
//

import Foundation

@MainActor class ProfileViewModel: ObservableObject {
    private let userDefaults = UserDefaultsManager.shared
    private let networkManager = NetworkManager.shared
    
    @Published var user: User?
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
    
    func fetchUserById() async {
        isLoading = true
        errorMessage = ""
        
        let userRequest = UserRequest(id: userDefaults.userId)
        
        do {
            let requestBody = try? JSONEncoder().encode(userRequest)

            let fetchedUser: BaseResponse<User> = try await networkManager.post(
                endpoint: Endpoint.getUserById,
                body: requestBody,
                responseType: BaseResponse<User>.self
            )
            self.user = fetchedUser.data
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func logout() {
        userDefaults.isUserLoggedIn = false
        userDefaults.userId = -1
    }
}
