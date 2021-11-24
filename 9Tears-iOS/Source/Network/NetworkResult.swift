//
//  NetworkResult.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation

enum NetworkResult {
    case success
    case error(NetworkError)
}

enum NetworkResultWithValue<T: Codable> {
  case success(T)
  case error(NetworkError)
}

