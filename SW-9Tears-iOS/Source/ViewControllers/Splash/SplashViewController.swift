//
//  SplashViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit

final class SplashViewController: BaseViewController, View {
    
    typealias Reactor = SplashViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        static let imageSize = 135.f
    }
    
    fileprivate struct Font {
        static let titleFont = UIFont(name: "BlackHanSans-Regular", size: 60)
        static let subFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let logo = UIImageView().then {
        $0.image = UIImage.init(named: "SplashLogo")
        $0.tintColor = .white
    }
    
    let titleLabel = UILabel().then {
        $0.text = "바랭"
        $0.font = Font.titleFont
        $0.textColor = .white
    }
    
    let subLabel = UILabel().then {
        $0.text = "9시간의 눈물"
        $0.font = Font.subFont
        $0.textColor = .white
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
        
        self.view.backgroundColor = .tintColor
        
        self.view.addSubview(self.logo)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.subLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.logo.snp.makeConstraints {
            $0.height.width.equalTo(Metric.imageSize)
            $0.center.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.logo.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        self.subLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSafeArea(self.view)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        self.rx.viewDidAppear.asObservable()
            .map { _ in Reactor.Action.setNextView }
            .delay(.seconds(1), scheduler: MainScheduler.instance)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

