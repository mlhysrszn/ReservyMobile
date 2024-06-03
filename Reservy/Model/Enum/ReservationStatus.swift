//
//  ReservationStatus.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 3.06.2024.
//

import Foundation

enum ReservationStatus: String, Decodable {
    case created
    case active
    case completed
    case canceled
    case confirmed
    case booked // Remove it
}
