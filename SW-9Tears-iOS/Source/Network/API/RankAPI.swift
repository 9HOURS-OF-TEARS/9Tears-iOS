//
//  RankAPI.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation
import Moya

enum RankAPI {
    case getList(String, String)
}

extension RankAPI: BaseAPI2 {
    
    var path: String {
        switch self {
        case .getList:
            return "/post"
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
        case .getList:
            return .get
            
        default:
            return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case let .getList(type, duration):
            return [
                "criterion" : type,
                "duration" : duration
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
        case .getList:
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

