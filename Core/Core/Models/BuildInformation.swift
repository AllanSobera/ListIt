//
//  BuildInformation.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//
import Foundation

public final class BuildInformation: Sendable {
    
    public static let shared = BuildInformation()
    
    public var isMock: Bool {
        return getIsMock()
    }
    
    private init () {}
    
    private func getIsMock() -> Bool {
        let isMockString = ProcessInfo.processInfo.environment["isMock"] ?? "false"
        let isMock = (isMockString as NSString).boolValue
        return isMock
    }
}
