//
//  ReservationsViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 3.06.2024.
//

import Foundation

@MainActor class ReservationsViewModel: ObservableObject {
    private let networkManager = NetworkManager.shared
    private let userDefaults = UserDefaultsManager.shared
    
    @Published var reservations: [Reservation] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var successMessage: String = ""
    @Published var showAlert: Bool = false

    func fetchReservations() async {
        isLoading = true
        let request = UserRequest(id: userDefaults.userId)
        let requestBody = try? JSONEncoder().encode(request)
        
        do {
            let response: BaseResponse<[Reservation]> = try await networkManager.post(
                endpoint: .getReservations,
                body: requestBody,
                responseType: BaseResponse<[Reservation]>.self
            )
            
            if !response.data.isEmpty {
                reservations = response.data
            } else {
                errorMessage = "You don't have a reservation."
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func cancelReservation(reservationId: Int) async {
        showAlert = false
        let request = CancelReservationRequest(reservationId: reservationId)
        let requestBody = try? JSONEncoder().encode(request)
        
        do {
            let response: EmptyResponse = try await networkManager.post(
                endpoint: .cancelReservation,
                body: requestBody,
                responseType: EmptyResponse.self
            )
            successMessage = response.message
            showAlert = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
