//
//  RegisterRequest.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

struct RegisterRequest: Encodable {
    let firstname: String
    let lastname: String
    let email: String
    let phoneNumber: String
    let password: String
}

