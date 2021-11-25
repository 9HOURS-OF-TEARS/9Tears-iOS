//
//  SignUpViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit

final class SignUpViewController: BaseViewController, View {
    
    typealias Reactor = SignUpViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        static let imageSize = 62.f
        static let viewSide = 60.f
        
        static let textFieldHeight = 40.f
        
        static let buttonHiehgt = 40.f
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
    
    let nicknameTextField = RankTextField().then {
        $0.textField.keyboardType = .default
        $0.textField.placeholder = "닉네임을 입력해주세요."
    }
    
    let emailTextField = RankTextField().then {
        $0.textField.keyboardType = .emailAddress
        $0.textField.placeholder = "이메일을 입력해주세요."
    }
    
    let passwordTextField = RankTextField().then {
        $0.textField.keyboardType = .default
        $0.textField.placeholder = "비밀번호를 입력해주세요."
        $0.textField.isSecureTextEntry = true
    }
    
    let signUpButton = RankButton().then {
        $0.setTitle("Sign up", for: .normal)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.image)
        self.view.addSubview(self.subtitleLabel)
        self.view.addSubview(self.nicknameTextField)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.signUpButton)
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
        
        self.nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(self.subtitleLabel.snp.bottom).offset(50)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.height.equalTo(Metric.textFieldHeight)
        }
        
        self.emailTextField.snp.makeConstraints {
            $0.top.equalTo(self.nicknameTextField.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.height.equalTo(Metric.textFieldHeight)
        }
        
        self.passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.height.equalTo(Metric.textFieldHeight)
        }
        
        self.signUpButton.snp.makeConstraints {
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(Metric.viewSide)
            $0.right.equalToSuperview().offset(-Metric.viewSide)
            $0.height.equalTo(Metric.buttonHiehgt)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
    }
}

