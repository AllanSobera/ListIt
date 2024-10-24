//
//  Encodable+extension.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 20/10/24.
//

import Foundation

extension Encodable {

    public func toData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
