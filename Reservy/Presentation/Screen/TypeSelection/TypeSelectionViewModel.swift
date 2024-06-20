//
//  TypeSelectionViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 8.06.2024.
//

import Foundation

class TypeSelectionViewModel: ObservableObject {
    private let networkManager = NetworkManager.shared
    
    @Published var reservationTypes: [ReservationType] = []
    @Published var selectedType: ReservationType?
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
    
    func fetchReservationTypes(businessID: Int) async {
        isLoading = true
        errorMessage = ""
        
        do {
            let types: BaseResponse<[ReservationType]> = try await networkManager.get(
                endpoint: Endpoint.reservationTypes,
                queryParameters: ["business_id": "\(businessID)"],
                responseType: BaseResponse<[ReservationType]>.self
            )
            self.reservationTypes = types.data
            if types.data.isEmpty {
                errorMessage = "There is no type to select"
            }
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
