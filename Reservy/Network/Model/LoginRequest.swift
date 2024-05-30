//
//  LoginRequest.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 27.05.2024.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
