//
//  UIViewcontroller.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/26.
//

import Foundation
import UIKit
import Then

extension UIViewController {
    func setNavigationBar(title: String, backgroundColor: UIColor) {
        
        let leftBarButton = UIBarButtonItem().then {
            $0.image = UIImage(named: "leftBarButton")
        }
        
        let rightBarButton = UIBarButtonItem().then {
            $0.image = UIImage(systemName: "line.horizontal.3")
            $0.tintColor = .white
        }
        self.navigationController?.navigationBar.backgroundColor = nil
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.title = title
        self.navigationController?.navigationBar.tintColor = .white
    }
}
