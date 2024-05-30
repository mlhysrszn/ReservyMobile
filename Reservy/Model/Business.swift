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
    let category: String
    let address: String
    let city: String
    let country: String
    let phoneNumber: String
    let email: String
    let workingHours: String
    let rating: Double
    let photos: [String]
    let location: Location
    let reviews: [Review]
}
