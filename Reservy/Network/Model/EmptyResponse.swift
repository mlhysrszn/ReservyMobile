//
//  EmptyResponse.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 2.06.2024.
//

import Foundation

struct EmptyResponse: Decodable {
    let status: Int
    let message: String
}
