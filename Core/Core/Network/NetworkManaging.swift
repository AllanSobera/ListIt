//
//  NetworkManaging.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 20/10/24.
//

import Foundation

public protocol NetworkManaging: AnyObject {
    @discardableResult
    func execute<T: Codable>(request: HTTPRequesting, resultType: T.Type, withJSONResponse: Bool) async throws -> T
}

public extension NetworkManaging {
    @discardableResult
    func execute<T: Codable>(request: HTTPRequesting, resultType: T.Type) async throws -> T {
        try await execute(request: request, resultType: resultType, withJSONResponse: true)
    }
}
