//
//  DataStateGeneric.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//

import Foundation

public enum DataStateGeneric<T: Equatable>: Equatable {
    case error(_ error: Error)
    case success(_ data: T)
    case loading
        
    public static func == (lhs: DataStateGeneric, rhs: DataStateGeneric) -> Bool {
        switch (lhs, rhs) {
        case let (.error(lhsError), .error(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case let (.success(lhsData), .success(rhsData)):
            return lhsData == rhsData
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    
}
