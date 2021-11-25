//
//  AuthService.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import KeychainAccess
import RxSwift
import Moya

protocol AuthServiceType: AnyObject {
    var currentToken: String? { get }
    
    func verifyId(_ id: String) -> Single<NetworkResult>
    func verifyNickname(_ nickname: String) -> Single<NetworkResult>
    
    func signIn(_ id: String, _ password: String) -> Single<NetworkResult>
    func signUp(_ id: String, _ password: String, _ nickname: String) -> Single<NetworkResult>
    func logout()
}

final class AuthService: AuthServiceType {

    fileprivate let network: Network<AuthAPI>
    fileprivate let keychain = Keychain(service: "sw.hackathon.SW-9Tears-iOS")
    private(set) var currentToken: String?
    
    init(network: Network<AuthAPI>) {
        self.network = network
        self.currentToken = self.getToken()
    }
    
    func verifyId(_ id: String) -> Single<NetworkResult> {
        return network.requestWithoutMapping(.idCheck(id))
    }
    
    func verifyNickname(_ nickname: String) -> Single<NetworkResult> {
        return network.requestWithoutMapping(.nicknameCheck(nickname))
    }
    
    func signIn(_ id: String, _ password: String) -> Single<NetworkResult> {
        return network.requestObject(.signIn(id, password), type: AccessToken.self)
            .map { [weak self] result in
                switch result{
                case let .success(token):
                    try? self?.saveToken(token.AccessToken)
                    self?.currentToken = token.AccessToken
                    return .success
                case let .error(error):
                    return .error(error)
                }
            }
    }
    
    func signUp(_ id: String, _ password: String, _ nickname: String) -> Single<NetworkResult> {
        return network.requestWithoutMapping(.signUp(id, password, nickname))
    }

    func logout() {
        self.removeToken()
        self.currentToken = nil
    }
    
    fileprivate func saveToken(_ token: String) throws {
        try self.keychain.set(token, key: "token")
    }
    
    fileprivate func getToken() -> String? {
        return try? keychain.getString("token")
    }
    
    fileprivate func removeToken() {
        try? self.keychain.remove("token")
    }

    
}
