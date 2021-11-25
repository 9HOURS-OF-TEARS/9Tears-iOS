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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return .formatted(formatter)
    }
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = self.dateDecodingStrategy
        return decoder
    }
    
}
