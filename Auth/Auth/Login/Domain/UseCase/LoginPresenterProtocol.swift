//
//  LoginPresenterProtocol.swift
//  Auth
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//

import Foundation

protocol LoginPresenterProtocol {
    func didReceive(_ output: LoginUseCase.Output)
}
