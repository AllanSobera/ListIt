//
//  LoginServiceProtocol.swift
//  Auth
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//

import Foundation

protocol LoginServiceProtocol {
    func login(userName: String, password: String) async throws -> LoginEntity
}
