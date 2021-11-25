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

    fileprivate let authNetwork: Network<AuthAPI>
    fileprivate let signNetwork: Network<SignAPI>
    fileprivate let keychain = Keychain(service: "sw.hackathon.SW-9Tears-iOS")
    private(set) var currentToken: String?
    
    init(authNetwork: Network<AuthAPI>, signNetwork: Network<SignAPI>) {
        self.authNetwork = authNetwork
        self.signNetwork = signNetwork
        
        self.currentToken = self.getToken()
    }
    
    func verifyId(_ id: String) -> Single<NetworkResult> {
        return authNetwork.requestWithoutMapping(.idCheck(id))
    }
    
    func verifyNickname(_ nickname: String) -> Single<NetworkResult> {
        return authNetwork.requestWithoutMapping(.nicknameCheck(nickname))
    }
    
    func signIn(_ id: String, _ password: String) -> Single<NetworkResult> {
        return signNetwork.requestObject(.signIn(id, password), type: AccessToken.self)
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
        return authNetwork.requestWithoutMapping(.signUp(id, password, nickname))
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
