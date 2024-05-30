//
//  ErrorRequest.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: Int
    let message: String
}
