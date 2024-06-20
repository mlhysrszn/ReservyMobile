//
//  AvailableHoursRequest.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.06.2024.
//

import Foundation

struct AvailableHoursRequest: Encodable {
    let businessId: Int
    let typeId: Int
    let date: String
}
