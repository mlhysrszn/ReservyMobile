//
//  Endpoint.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

enum Endpoint {
    case register
    case login
    case businessList
    case availableHours
    case book
    case getUserById
    case getReservations
    case cancelReservation
    case deleteAccount
    case reservationTypes
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var headers: [String: String]? { get }
}

extension Endpoint: EndpointProtocol {
    
    var urlString: String {
        return "\(baseUrl)/\(path)"
    }
    
    var baseUrl: String {
        return "https://api.canerture.com/reservy"
    }
    
    var headers: [String: String]? {
        return [
            "content-type": "application/json",
            "x-device-os-type": "iOS",
            "x-channel": "Mobile"
        ]
    }
    
    var path: String {
        switch self {
        case .register:
            return "register"
        case .login:
            return "login"
        case .businessList:
            return "get_businesses"
        case .availableHours:
            return "get_available_hours"        
        case .book:
            return "book"
        case .getUserById:
            return "get_user_by_id"
        case .getReservations:
            return "get_reservations"
        case .cancelReservation:
            return "cancel_reservation"        
        case .deleteAccount:
            return "delete_account"
        case .reservationTypes:
            return "get_reservation_types"
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        case .businessList:
            return .get
        case .availableHours:
            return .post        
        case .book:
            return .post  
        case .getUserById:
            return .post 
        case .getReservations:
            return .post
        case .cancelReservation:
            return .post        
        case .deleteAccount:
            return .post 
        case .reservationTypes:
            return .get
        }
    }
}
