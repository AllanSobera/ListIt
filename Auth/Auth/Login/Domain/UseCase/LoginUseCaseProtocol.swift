//
//  LoginUseCaseProtocol.swift
//  Auth
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//

import Foundation

protocol LoginUseCaseProtocol {
    func execute(_ credentials: LoginUseCase.Input) async
}
