//
//  BaseAPI2.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Moya
import Foundation

protocol BaseAPI2: TargetType {}

extension BaseAPI2 {
    
    var baseURL: URL { URL(string: "http://118.67.142.221:8080")! }
    
    var headers: [String : String]? { nil }
    
    var method: Moya.Method { .get }
    
    var task: Task { .requestPlain }
    
    var sampleData: Data { Data() }
}

