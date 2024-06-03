//
//  Reservation.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import Foundation
import SwiftUI

struct Reservation: Decodable {
    let id: Int
    let time: String
    let timePeriod: String
    let status: ReservationStatus
    let note: String
    let business: Business
    
    var actionText: String {
        switch status {
        case .active:
            "Cancel Reservation"
        case .completed:
            "Review Reservation"
        case .canceled:
            "Canceled"
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
