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
    case badRequest = 400
    case conflict = 409
    
    var message: String {
        switch self {
        case .unknown:
            return NetworkErrorMsg.unknownMsg.rawValue
        case .badRequest:
            return NetworkErrorMsg.badRequestMsg.rawValue
        case .conflict:
            return NetworkErrorMsg.conflictMsg.rawValue
        }
    }
}

enum NetworkErrorMsg: String {
    case unknownMsg = "서버와의 통신중 에러가 발생했습니다."
    case badRequestMsg = "잘못된 요청"
    case conflictMsg = "값이 중복됨"
}
