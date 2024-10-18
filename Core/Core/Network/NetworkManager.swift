//
//  NetworkManager.swift
//  Core
//
//  Created by Premiersoft on 11/10/24.
//

import Foundation

public final class NetworkManager {
    
    public init() {
        
    }
    
    @discardableResult
    public func request<T: Codable>(target: HTTPRequesting, resultType: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            
        }
        
        
        
        
    }
}
