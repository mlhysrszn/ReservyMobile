//
//  User.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

struct User: Decodable {
    let id: Int
    let email: String
    let firstname: String
    let lastname: String
    let phoneNumber: String
}
