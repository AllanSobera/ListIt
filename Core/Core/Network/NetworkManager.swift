//
//  NetworkManager.swift
//  Core
//
//  Created by Allan Soberanski on 11/10/24.
//

import Foundation

public final class NetworkManager: NetworkManaging {
    
    private let dataTasking: DataTasking
    
    
    public init(dataTasking: DataTasking = URLSession.shared) {
        self.dataTasking = dataTasking
    }
    
    public func execute<T>(
        request: any HTTPRequesting,
        resultType: T.Type,
        withJSONResponse: Bool
    ) async throws -> T where T : Decodable, T : Encodable {
        do {
            let request = URLRequest.from(httpRequest: request)
            let (data, response) = try await dataTasking.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw ErrorRequest(message: "An error occurred when parsing the response")
            }
            
            let statusCode = response.statusCode
            
            switch statusCode {
            case 200...299:
                return try JSONDecoder().decode(T.self, from: data)
            case 401:
                throw ErrorRequest(message: "Unauthorized")
            case 400, 500:
                throw ErrorRequest(message: "An error with the request occurred")
            default:
                throw ErrorRequest(message: "An unexpected error occurred")
            }
        } catch {
            throw error
        }
    }
}
