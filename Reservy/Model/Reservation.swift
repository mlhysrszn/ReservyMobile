//
//  Reservation.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.05.2024.
//

import Foundation
import SwiftUI

struct Reservation: Hashable {
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

let dummyReservation = Reservation(
    reservationId: 0,
    userId: 0,
    business: Business(
        id: 0,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE",
        phoneNumber: "+90 535 078 6767",
        mail: "mlhysrszn@gmail.com"
    ),
    date: "19 January Friday\n16.00 - 17.00 (1 hour)",
    status: ReservationStatus.active,
    creationDate: "19.05.2005",
    notes: "Note"
)

let dummyReservationsList = [
    Reservation(
        reservationId: 0,
        userId: 0,
        business: Business(
            id: 0,
            name: "Beauty Center",
            openHours: "09.00 - 18.00",
            rating: 3.5,
            address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE",
            phoneNumber: "+90 535 078 6767",
            mail: "mlhysrszn@gmail.com"
        ),
        date: "19 January Friday\n16.00 - 17.00 (1 hour)",
        status: ReservationStatus.active,
        creationDate: "19.05.2005",
        notes: "Note"
    ),
    Reservation(
        reservationId: 1,
        userId: 0,
        business: Business(
            id: 0,
            name: "Barber Shop",
            openHours: "09.00 - 18.00",
            rating: 3.5,
            address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE",
            phoneNumber: "+90 535 078 6767",
            mail: "mlhysrszn@gmail.com"
        ),
        date: "19 January Friday\n16.00 - 17.00 (1 hour)",
        status: ReservationStatus.active,
        creationDate: "19.05.2005",
        notes: "Note"
    ),    
    Reservation(
        reservationId: 2,
        userId: 0,
        business: Business(
            id: 0,
            name: "Barber Shop",
            openHours: "09.00 - 18.00",
            rating: 3.5,
            address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE",
            phoneNumber: "+90 535 078 6767",
            mail: "mlhysrszn@gmail.com"
        ),
        date: "19 January Friday\n16.00 - 17.00 (1 hour)",
        status: ReservationStatus.active,
        creationDate: "19.05.2005",
        notes: "Note"
    )
]
