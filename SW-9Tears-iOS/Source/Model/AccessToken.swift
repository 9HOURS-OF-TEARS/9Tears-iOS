//
//  AccessToken.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

struct AccessToken: ModelType {
    var AccessToken: String
    
    enum CodingKeys: String, CodingKey {
        case AccessToken = "access_token"
    }
}
