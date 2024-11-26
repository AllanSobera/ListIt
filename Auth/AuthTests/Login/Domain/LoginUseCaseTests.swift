//
//  LoginUseCaseTests.swift
//  Auth
//
//  Created by Allan Carlos Soberanski on 29/10/24.
//

import Testing
import Core
@testable import Auth

struct LoginUseCaseTests {
    
    private let loginServiceSpy = LoginServiceSpy()
    private let loginPresenterSpy = LoginPresenterSpy()
    private lazy var useCase = LoginUseCase(
        loginService: loginServiceSpy,
        presenter: loginPresenterSpy
    )
    
    @Test("Test the happy path") mutating func test_theSuccessCase() async throws {
        let expected: [LoginUseCase.Output] = [
            .init(
                dataState: .loading
            ),
            .init(
                dataState: .success(
                    LoginEntity(
                        token: "token"
                    )
                )
            )
        ]
        
        await useCase.execute(LoginUseCase.Input(username: "username", password: "password"))
        
        #expect(loginPresenterSpy.executions == expected)
    }
    
    @Test mutating func test_theFailureCase() async throws {
        let expected: [LoginUseCase.Output] = [
            .init(
                dataState: .loading
            ),
            .init(
                dataState: .error(ErrorRequest(message: ""))
            )
        ]
        
        loginServiceSpy.response = .failure(ErrorRequest(message: ""))
        
        await useCase.execute(LoginUseCase.Input(username: "username", password: "password"))
        
        #expect(expected == loginPresenterSpy.executions)
    }
}

fileprivate final class LoginServiceSpy: LoginServiceProtocol {
    
    var executions: [Execution] = []
    var response: Response = .success
    
    struct Execution: Equatable {
        let userName: String
        let password: String
    }
    
    enum Response {
        case success
        case failure(Error)
    }
    
    func login(userName: String, password: String) async throws -> Auth.LoginEntity {
        executions.append(.init(userName: userName, password: password))
        
        if case .failure(let error) = response {
            throw error
        }
        
        return LoginEntity.init(token: "token")
    }
}

fileprivate final class LoginPresenterSpy: LoginPresenterProtocol {
    var executions: [LoginUseCase.Output] = []

    func didReceive(_ output: Auth.LoginUseCase.Output) {
        executions.append(output)
    }
}
