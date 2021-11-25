//
//  BaseAPI.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Moya
import Foundation

protocol BaseAPI1: TargetType {}

extension BaseAPI1 {
    
    var baseURL: URL { URL(string: "http://118.67.142.221:8081")! }
    
    var headers: [String : String]? { nil }
    
    var method: Moya.Method { .get }
    
    var task: Task { .requestPlain }
    
    var sampleData: Data { Data() }
}
