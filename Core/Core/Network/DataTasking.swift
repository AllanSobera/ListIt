//
//  DataTasking.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 20/10/24.
//

import Foundation

public protocol DataTasking {
    @discardableResult
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: DataTasking {
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: request, delegate: nil)
    }
}

