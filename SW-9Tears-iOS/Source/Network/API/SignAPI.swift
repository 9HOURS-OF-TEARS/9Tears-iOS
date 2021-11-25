//
//  SignAPI.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation
import Moya

enum SignAPI {
    case signIn(String, String)
}

extension SignAPI: BaseAPI1 {
    
    var path: String {
        switch self {
        case .signIn:
            return "/signin/"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type" : "application/json"
            ]
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case let .signIn(id, pwd):
            return [
                "id" : id,
                "password" : pwd
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
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
