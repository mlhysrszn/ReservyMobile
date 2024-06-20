//
//  ReservationType.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 8.06.2024.
//

import Foundation

struct ReservationType: Identifiable, Codable {
    let id: Int
    let timePeriod: Int
    let type: String
    let name: String
    let price: String
}
