//
//  NetworkError.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(message: String = "The URL is invalid.")
    case noData(message: String = "No data received from the server.")
    case decodingError(message: String = "Failed to decode response.")
    case serverError(message: String)
    case other(message: String)
}

extension NetworkError {
    var message: String {
        switch self {
        case .invalidURL(let message),
             .noData(let message),
             .decodingError(let message),
             .serverError(let message),
             .other(let message):
            return message
        }
    }
}
