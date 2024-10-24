//
//  ErrorRequest.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 21/10/24.
//

import Foundation

public struct ErrorRequest: Error {
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}
