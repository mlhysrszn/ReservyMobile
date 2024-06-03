//
//  Business.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import Foundation

struct Business: Codable {
    let id: Int
    let name: String
    let category: String?
    let address: String
    let city: String?
    let country: String?
    let phoneNumber: String?
    let email: String?
    let timePeriod: Int?
    let rating: Double?
    let photos: [String]?
    let location: Location?
    let reviews: [Review]?
    let workingHours: [Workday]?
}

extension Business {
    func formatHour(_ hour: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        guard let date = dateFormatter.date(from: hour) else { return hour }
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

    func todaysWorkingHours() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let today = dateFormatter.string(from: Date())
        
        if let todayWorkingHour = workingHours?.first(where: { $0.dayName == today }) {
            return "Today: \(formatHour(todayWorkingHour.openHour)) - \(formatHour(todayWorkingHour.closeHour))"
        } else {
            return "Closed Today"
        }
    }
    
    func allWorkingHours() -> String {
        return workingHours?.map { "\($0.dayName): \(formatHour($0.openHour)) - \(formatHour($0.closeHour))" }
            .joined(separator: "\n") ?? ""
    }
}
