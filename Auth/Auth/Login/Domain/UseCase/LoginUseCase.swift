//
//  LoginUseCase.swift
//  Auth
//
//  Created by Allan Carlos Soberanski on 28/10/24.
//

import Foundation
internal import Core

final class LoginUseCase {
    
    private let loginService: LoginServiceProtocol
    private let presenter: LoginPresenterProtocol
    
    init(
        loginService: LoginServiceProtocol,
        presenter: LoginPresenterProtocol
    ) {
        self.loginService = loginService
        self.presenter = presenter
    }
    
    struct Input: Equatable {
        let username: String
        let password: String
    }
    
    struct Output: Equatable {
        let dataState: DataStateGeneric<LoginEntity>
    }
}

extension LoginUseCase: LoginUseCaseProtocol {
    func execute(_ credentials: LoginUseCase.Input) async {
        do {
            presenter.didReceive(Output(dataState: .loading))
            let response = try await loginService.login(
                userName: credentials.username,
                password: credentials.password
            )
            presenter.didReceive(.init(dataState: .success(response)))
        } catch {
            presenter.didReceive(.init(dataState: .error(error)))
        }
    }
}
