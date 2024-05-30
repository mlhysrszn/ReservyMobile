//
//  BusinessListViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.05.2024.
//

import Foundation

class BusinessListViewModel: ObservableObject {
    @Published var businesses: [Business] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchBusinesses() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let businesses: BaseResponse<[Business]> = try await NetworkManager.shared.get(
                endpoint: Endpoint.businessList,
                responseType: BaseResponse<[Business]>.self
            )
            self.businesses = businesses.data
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
