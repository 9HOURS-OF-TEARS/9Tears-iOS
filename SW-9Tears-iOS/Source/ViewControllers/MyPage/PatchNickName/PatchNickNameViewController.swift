//
//  PatchNickNameViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/26.
//

import UIKit
import SnapKit
import Then

class PatchNickNameViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "닉네임 수정"
        $0.font = .init(name: "NotoSansKR-Regular", size: 20)
    }
    
    private let nickNameTextField = RankTextField().then {
        $0.textField.placeholder = "수정할 닉네임을 입력해주세요."
        $0.textField.keyboardType = .default
        $0.textField.font = .init(name: "NotoSansKR-Regular", size: 13)
    }
    
    private let nicknameButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor.init(named: "ThirdColor")
        $0.setTitle("중복 확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .init(name: "NotoSansKR-Regular", size: 13)!
    }
    
    private let patchNickNameButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor.init(named: "SecondColor")
        $0.setTitle("수정하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .init(name: "NotoSansKR-Regular", size: 13)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    
    private func setupSubViews() {
        [titleLabel, nickNameTextField, nicknameButton, patchNickNameButton].forEach({ self.view.addSubview($0) })
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(21)
            $0.centerX.equalToSuperview()
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalTo(59)
            $0.width.equalTo(180)
            $0.height.equalTo(30)
        }
        
        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.trailing.equalTo(-59)
            $0.width.equalTo(74)
            $0.height.equalTo(30)
        }
        
        patchNickNameButton.snp.makeConstraints {
            $0.top.equalTo(nicknameButton.snp.bottom).offset(27)
            $0.width.equalTo(260)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
    }
}
