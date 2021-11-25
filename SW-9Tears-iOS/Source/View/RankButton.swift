//
//  RankButton.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

final class RankButton: UIButton {
    
    // MARK: - Constants
    fileprivate struct Style {
        static let cornerRadius = 20.f
        static let titleFont = UIFont(name: "NotoSansKR-Bold", size: 15)
    }

    // MARK: - UI
    
    // MARK: - Initializing
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = Style.cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = .tintColor
        self.titleLabel?.font = Style.titleFont
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.white, for: .disabled)
    }
    
    override public var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(self.isHighlighted ? 0.5 : 1)
            }
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.isEnabled ? .tintColor : .init(named: "DisabledColor")
            }
        }
    }
    
}

