//
//  BookingRequest.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.06.2024.
//

import Foundation

struct BookingRequest: Codable {
    let businessId: Int
    let userId: Int
    let datetime: String
    let timePeriod: Int
    var note: String = ""
}
