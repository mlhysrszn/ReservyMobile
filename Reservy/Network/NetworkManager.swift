//
//  NetworkManager.swift
//  Reservy
//
//  Created by Melih Yaşar SÖZEN on 16.05.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(endpoint: Endpoint, body: Data? = nil, queryParameters: [String: String]? = nil, responseType: T.Type) async throws -> T {
        guard var urlComponents = URLComponents(string: endpoint.urlString) else {
            throw NetworkError.invalidURL()
        }

        if let queryParameters = queryParameters {
            urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.httpBody = body
        endpoint.headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        request.printCurl()
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noData()
        }
        
        guard !data.isEmpty else {
            throw NetworkError.noData()
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
            print("Error: \(errorResponse)")
            throw NetworkError.serverError(message: errorResponse.message)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            print("Response: \(decodedResponse)")
            return decodedResponse
        } catch {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received data: \(jsonString)")
            } else {
                print("Received data (non-UTF8): \(data)")
            }
            print(error.localizedDescription)
            throw NetworkError.decodingError(message: "Failed to decode response: \(error.localizedDescription)")
            
        }
    }
    
    func get<T: Decodable>(endpoint: Endpoint, queryParameters: [String: String]? = nil, responseType: T.Type) async throws -> T {
        return try await request(endpoint: endpoint, queryParameters: queryParameters, responseType: responseType)
    }
    
    func post<T: Decodable>(endpoint: Endpoint, body: Data?, responseType: T.Type) async throws -> T {
        return try await request(endpoint: endpoint, body: body, responseType: responseType)
    }
    
    
}


