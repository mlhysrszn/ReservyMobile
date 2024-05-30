//
//  Reservation.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import Foundation
import SwiftUI

struct Reservation {
    let reservationId: Int
    let userId: Int
    let business: Business
    let date: String
    let status: ReservationStatus
    let creationDate: String
    let notes: String
    
    var actionText: String {
        switch status {
        case .active:
            "Cancel Reservation"
        case .completed:
            "Review Reservation"
        default:
            ""
        }
    }
    
    var actionColor: Color {
        if status == .active {
            return Color.red
        }
        return Color.red
    }
    
    var isActive: Bool {
        status == .active
    }
}

enum ReservationStatus {
    case created
    case active
    case completed
    case canceled
}
