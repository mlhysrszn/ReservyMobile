//
//  Business.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.04.2024.
//

import Foundation

struct Business: Identifiable, Hashable {
    let id: Int
    let name: String
    let openHours: String
    let rating: Double
    let address: String
}

let dummyBusinessList = [
    Business(
        id: 0,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
    ), 
    Business(
        id: 1,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
    ),
    Business(
        id: 2,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
    ),
    Business(
        id: 3,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
    ),
    Business(
        id: 4,
        name: "Beauty Center",
        openHours: "09.00 - 18.00",
        rating: 3.5,
        address: "Şükrüpaşa Mahallesi Hasan Maksutoğlu Caddesi No:24 Kat: 1 Daire: 1 Merkez/EDİRNE"
    ),
]
