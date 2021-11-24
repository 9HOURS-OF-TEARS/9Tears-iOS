//
//  SnapKit.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import UIKit

import SnapKit

extension ConstraintMakerRelatable {
    @discardableResult
    public func equalToSafeArea(_ rootView: UIView, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.equalTo(rootView.safeAreaLayoutGuide, file, line)
    }
}
