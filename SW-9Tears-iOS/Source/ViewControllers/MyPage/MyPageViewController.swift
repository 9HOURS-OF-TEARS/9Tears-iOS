//
//  MyPageViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//


import UIKit

import ReactorKit

final class MyPageViewController: BaseViewController, View {
    
    typealias Reactor = MyPageViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        
    }
    
    fileprivate struct Font {
        static let nickNameFont = UIFont(name: "NotoSansKR-Bold", size: 25)
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let profileImage = UIImageView().then {
        $0.image = UIImage.init(named: "Profile")
    }
    
    let nickNameLabel = UILabel().then {
        $0.font = Font.nickNameFont
        $0.text = "멋짱풍파"
    }
    
    let editButton = UIButton(type: .system).then {
        $0.setImage(UIImage.init(named: "EditIcon"), for: .normal)
        $0.tintColor = .gray
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
        
        self.view.addSubview(self.profileImage)
        self.view.addSubview(self.nickNameLabel)
        self.view.addSubview(self.editButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.profileImage.snp.makeConstraints {
            $0.height.width.equalTo(90)
            $0.centerX.equalToSuperview()
            $0.top.equalToSafeArea(self.view).offset(100)
        }
        
        self.nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        self.editButton.snp.makeConstraints {
            $0.centerY.equalTo(self.nickNameLabel)
            $0.left.equalTo(self.nickNameLabel.snp.right).offset(5)
        }
        
        
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
    }
}

