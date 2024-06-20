//
//  BookViewModel.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.06.2024.
//

import Foundation

@MainActor class BookViewModel: ObservableObject {
    private let networkManager = NetworkManager.shared
    private let userDefaults = UserDefaultsManager.shared
    
    @Published var selectedDate = Date()
    @Published var availableHours: [Hour] = []
    @Published var selectedHour: Hour?
    @Published var isLoading: Bool = false
    @Published var isHoursLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var bookingSuccessful: Bool = false

    func fetchAvailablePeriods(businessID: Int, typeId: Int) async {
        isHoursLoading = true
        selectedHour = nil
        errorMessage = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: selectedDate)
        
        let availableHoursRequest = AvailableHoursRequest(
            businessId: businessID,
            typeId: typeId,
            date: dateString
        )
        
        do {
            let requestBody = try? JSONEncoder().encode(availableHoursRequest)
            
            let availableHours: BaseResponse<[Hour]> = try await networkManager.post(
                endpoint: Endpoint.availableHours,
                body: requestBody,
                responseType: BaseResponse<[Hour]>.self
            )
            self.availableHours = availableHours.data
            if availableHours.data.isEmpty {
                errorMessage = "This business is not open on the selected date"
            }
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = error.localizedDescription
        }
        isHoursLoading = false
    }
    
    func book(businessId: Int, timePeriod: Int) async {
        isLoading = true
        guard let selectedHour = selectedHour else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: selectedDate)
        
        let datetime = "\(dateString) \(selectedHour.time)"
        
        let bookingRequest = BookingRequest(
            businessId: businessId,
            userId: userDefaults.userId,
            datetime: datetime,
            timePeriod: timePeriod,
            note: ""
        )
        
        do {
            let requestBody = try? JSONEncoder().encode(bookingRequest)
            
            let _: EmptyResponse = try await networkManager.post(
                endpoint: Endpoint.book,
                body: requestBody,
                responseType: EmptyResponse.self
            )
            bookingSuccessful = true
            showAlert = true
            alertMessage = "Booking successful!"
        } catch let error as NetworkError {
            errorMessage = error.message
            showAlert = true
            alertMessage = errorMessage
        } catch {
            errorMessage = error.localizedDescription
            showAlert = true
            alertMessage = errorMessage
        }
        isLoading = false
    }
}
