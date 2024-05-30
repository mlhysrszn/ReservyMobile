//
//  NetworkExtensions.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 28.05.2024.
//

import Foundation

extension URLRequest {
    func printCurl() {
        var curl = "curl -v"
        
        if let method = self.httpMethod {
            curl += " -X \(method)"
        }
        
        if let headers = self.allHTTPHeaderFields {
            for (header, value) in headers {
                curl += " -H '\(header): \(value)'"
            }
        }
        
        if let body = self.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            curl += " -d '\(bodyString)'"
        }
        
        if let url = self.url {
            curl += " '\(url.absoluteString)'"
        }
        
        print(curl)
    }
}
