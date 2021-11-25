//
//  ModelType.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Then

protocol ModelType: Codable ,Then {
    static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy { get }
}

extension ModelType {
    static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        return .iso8601
    }
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = self.dateDecodingStrategy
        return decoder
    }
    
}
