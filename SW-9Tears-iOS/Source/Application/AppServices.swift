//
//  AppServices.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation

import SnapKit
import Then
import CGFloatLiteral

struct AppServices {
    
    let authService: AuthServiceType
    let rankService: RankServiceType
    
    init() {
        let authNetwork = Network<AuthAPI>(plugins: [
            RequestLoggingPlugin()
        ])
        let signNetwork = Network<SignAPI>(plugins: [
            RequestLoggingPlugin()
        ])
        
        self.authService = AuthService(authNetwork: authNetwork, signNetwork: signNetwork)
        
        let rankNetwork = Network<RankAPI>(plugins: [
            RequestLoggingPlugin(),
            AuthPlugin(authService: self.authService)
        ])
        
        self.rankService = RankService(network: rankNetwork)
    }
}
