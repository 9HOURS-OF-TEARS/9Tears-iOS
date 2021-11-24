//
//  SignInViewController.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import UIKit

import ReactorKit

final class SignInViewController: BaseViewController, View {
    
    typealias Reactor = SignInViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        static let imageSize = 62.f
    }
    
    fileprivate struct Font {
        static let titleFont = UIFont(name: "BlackHanSans-Regular", size: 60)
        static let subtitleFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let titleLabel = UILabel().then {
        $0.font = Font.titleFont
        $0.text = "바랭"
        $0.textColor = .tintColor
    }
    
    let subtitleLabel = UILabel().then {
        $0.font = Font.subtitleFont
        $0.text = "바른 랭킹\n: 바르고 고운 말로 소통해보세요!"
        $0.textColor = .tintColor
        $0.numberOfLines = 2
    }
    
    let image = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    // MARK: - Inintializing
    init(reactor: Reactor) {
        super.init()
        defer {
            self.reactor = reactor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.image)
        self.view.addSubview(self.subtitleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSafeArea(self.view).offset(110)
            $0.left.equalToSuperview().offset(55)
        }
        
        self.image.snp.makeConstraints {
            $0.centerY.equalTo(self.titleLabel)
            $0.height.width.equalTo(Metric.imageSize)
            $0.left.equalTo(self.titleLabel.snp.right).offset(10)
        }
        
        self.subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.image.snp.bottom)
            $0.left.equalTo(self.titleLabel)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
    }
}
