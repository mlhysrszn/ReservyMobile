//
//  BaseResponse.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 27.05.2024.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let data: T
    let status: Int
    let message: String
}
