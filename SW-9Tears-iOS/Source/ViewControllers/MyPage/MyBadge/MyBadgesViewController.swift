//
//  MyBadgesViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/26.
//

import UIKit
import SnapKit
import Then

class MyBadgesViewController: UIViewController {
    
    private let backButton = UIButton(type: .system).then {
        $0.setImage(.init(named: "BackButton"), for: .normal)
        $0.tintColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "내 뱃지"
        $0.font = .init(name: "NotoSansKR-Regular", size: 20)
    }
    
    private let badgeImageView1 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }
    
    private let badgeImageView2 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }
    
    private let badgeImageView3 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }
    
    private let badgeImageView4 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }
    
    private let badgeImageView5 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }
    
    private let badgeImageView6 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 7
        $0.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        setNavigationBar(title: "마이페이지", backgroundColor: UIColor.init(named: "AccentColor")!)
    }
    
    private func setUpSubViews() {
        [backButton, titleLabel, badgeImageView1, badgeImageView2, badgeImageView3, badgeImageView4, badgeImageView5, badgeImageView6].forEach({ self.view.addSubview($0) })
        
        backButton.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(25)
            $0.top.equalTo(26)
            $0.leading.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(21)
            $0.centerX.equalToSuperview()
        }
        
        badgeImageView1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.leading.equalTo(21)
        }
        
        badgeImageView2.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.trailing.equalTo(-21)
        }
        
        badgeImageView3.snp.makeConstraints {
            $0.top.equalTo(badgeImageView1.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.leading.equalTo(21)
        }
        
        badgeImageView4.snp.makeConstraints {
            $0.top.equalTo(badgeImageView2.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.trailing.equalTo(-21)
        }
        
        badgeImageView5.snp.makeConstraints {
            $0.top.equalTo(badgeImageView3.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.leading.equalTo(21)
        }
        
        badgeImageView6.snp.makeConstraints {
            $0.top.equalTo(badgeImageView4.snp.bottom).offset(31)
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.trailing.equalTo(-21)
        }
    }
}
