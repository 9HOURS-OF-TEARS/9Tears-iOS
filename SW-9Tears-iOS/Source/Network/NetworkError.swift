//
//  NetworkError.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation
import RxSwift

enum NetworkError: Int, Error {
    // ALL
    case unknown = 0
    
    
    var message: String {
        switch self {
        case .unknown:
            return NetworkErrorMsg.unknownMsg.rawValue
        }
    }
}

enum NetworkErrorMsg: String {
    case unknownMsg = "서버와의 통신중 에러가 발생했습니다."
}
