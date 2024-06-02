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
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var headers: [String: String]? { get }
}

extension Endpoint: EndpointProtocol {
    
    var urlString: URL? {
        URL(string: "\(baseUrl)/\(path)")
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
        }
    }
}
