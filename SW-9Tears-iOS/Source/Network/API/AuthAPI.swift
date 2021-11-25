//
//  AuthAPI.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation
import Moya

enum AuthAPI {
    // check
    case idCheck(String)
    case nicknameCheck(String)
    
    // auth
    case signUp(String, String, String)
}

extension AuthAPI: BaseAPI1 {
    
    var path: String {
        switch self {
        case .idCheck:
            return "/check/id"
        case .nicknameCheck:
            return "/check/nickname"
        case .signUp:
            return "/sign-up"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return [
                "Content-Type" : "application/json"
            ]
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .idCheck, .nicknameCheck:
            return .head
        default:
            return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case let .idCheck(id):
            return [
                "key" : id
            ]
        case let .nicknameCheck(nickname):
            return [
                "key" : nickname,
            ]
        case let .signUp(id, pwd, nickname):
            return [
                "id" : id,
                "password" : pwd,
                "nickname" : nickname
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
        case .idCheck, .nicknameCheck:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            }
        default:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: parameterEncoding)
            }
        }
        return .requestPlain
    }
    
    var validationType: ValidationType {
        return .none
    }
}
