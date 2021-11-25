//
//  Date.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

extension Date {
    var dataString: String {
        let dateFormatter = DateFormatter().then {
            $0.dateFormat = "yyyy-MM-dd"
        }
        return dateFormatter.string(from: self)
    }
    
    var viewString: String {
        let dateFormatter = DateFormatter().then {
            $0.dateFormat = "yyyy.MM.dd"
        }
        return dateFormatter.string(from: self)
    }
}
