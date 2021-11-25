//
//  MyPageViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//


import UIKit

import ReactorKit
import SnapKit
import Then

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
    private let backButton = UIButton(type: .system).then {
        $0.setImage(.init(named: "BackButton"), for: .normal)
        $0.tintColor = .black
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage.init(named: "Profile")
    }
    
    private let nickNameLabel = UILabel().then {
        $0.font = Font.nickNameFont
        $0.text = "멋짱풍파"
    }
    
    private let editButton = UIButton(type: .system).then {
        $0.setImage(UIImage.init(named: "EditIcon"), for: .normal)
        $0.tintColor = .gray
    }
    
    private let commentCountImageView = UIImageView().then {
        $0.image = UIImage(named: "CommentSticker")
        $0.contentMode = .scaleAspectFit
    }
    
    private let rankCommentCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 40)
        $0.text = "18"
    }
    
    private let rankCommentLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 22)
        $0.text = "등"
    }
    
    private let postCountImageView = UIImageView().then {
        $0.image = UIImage(named: "PostSticker")
        $0.tintColor = UIColor.init(named: "OrangeColor")
        $0.contentMode = .scaleAspectFit
    }
    
    private let rankPostCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 40)
        $0.text = "2"
    }
    
    private let rankPostLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 22)
        $0.text = "등"
    }
    
    private let myPostButton = UIButton(type: .system).then {
        $0.setImage(UIImage.init(named: "Posts"), for: .normal)
        $0.tintColor = .init(named: "AccentColor")
    }
    
    private let myPostLabel = UILabel().then {
        $0.text = "내 게시글"
        $0.font = .init(name: "NotoSansKR-Regular", size: 15)
    }
    
    private let badgeButton = UIButton(type: .system).then {
        $0.setImage(.init(named: "Badge"), for: .normal)
        $0.tintColor = .init(named: "AccentColor")
    }
    
    private let badgeLabel = UILabel().then {
        $0.text  = "내 뱃지"
        $0.font = .init(name: "NotoSansKR-Regular", size: 15)
    }
    
    private let smileButton = UIButton(type: .system).then {
        $0.setImage(.init(named: "PostSticker"), for: .normal)
        $0.tintColor = .init(named: "AccentColor")
    }
    
    private let smileLabel = UILabel().then {
        $0.text = "13"
        $0.font = .init(name: "NotoSansKR-Regular", size: 15)
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
        
        [backButton, profileImage, nickNameLabel, editButton, commentCountImageView, rankCommentLabel, rankCommentCountLabel, postCountImageView, rankPostCountLabel, rankPostLabel, myPostButton, myPostLabel, badgeButton, badgeLabel, smileButton, smileLabel].forEach({ self.view.addSubview($0) })
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        backButton.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(25)
            $0.top.equalTo(26)
            $0.leading.equalTo(24)
        }
        
        profileImage.snp.makeConstraints {
            $0.height.width.equalTo(90)
            $0.centerX.equalToSuperview()
            $0.top.equalToSafeArea(self.view).offset(100)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        editButton.snp.makeConstraints {
            $0.centerY.equalTo(self.nickNameLabel)
            $0.left.equalTo(self.nickNameLabel.snp.right).offset(5)
        }
        
        commentCountImageView.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(70)
            $0.leading.equalTo(72)
            $0.width.height.equalTo(31)
        }
        
        rankCommentCountLabel.snp.makeConstraints {
            $0.leading.equalTo(commentCountImageView.snp.trailing).offset(6)
            $0.centerY.equalTo(commentCountImageView.snp.centerY)
        }
        
        rankCommentLabel.snp.makeConstraints {
            $0.centerY.equalTo(rankCommentCountLabel.snp.centerY)
            $0.leading.equalTo(rankCommentCountLabel.snp.trailing).offset(1)
        }
        
        postCountImageView.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(70)
            $0.leading.equalTo(rankCommentLabel.snp.trailing).offset(31)
            $0.width.height.equalTo(31)
        }
        
        rankPostCountLabel.snp.makeConstraints {
            $0.leading.equalTo(postCountImageView.snp.trailing).offset(6)
            $0.centerY.equalTo(postCountImageView.snp.centerY)
        }
        
        rankPostLabel.snp.makeConstraints {
            $0.centerY.equalTo(rankPostCountLabel.snp.centerY)
            $0.leading.equalTo(rankPostCountLabel.snp.trailing).offset(1)
        }
        
        myPostButton.snp.makeConstraints {
            $0.top.equalTo(commentCountImageView.snp.bottom).offset(58)
            $0.leading.equalTo(53)
            $0.width.height.equalTo(58)
        }
        
        myPostLabel.snp.makeConstraints {
            $0.top.equalTo(myPostButton.snp.bottom).offset(3)
            $0.centerX.equalTo(myPostButton)
        }
        
        badgeButton.snp.makeConstraints {
            $0.top.equalTo(commentCountImageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(58)
        }
        
        badgeLabel.snp.makeConstraints {
            $0.top.equalTo(badgeButton.snp.bottom).offset(3)
            $0.centerX.equalTo(badgeButton)
        }
        
        smileButton.snp.makeConstraints {
            $0.top.equalTo(commentCountImageView.snp.bottom).offset(58)
            $0.leading.equalTo(badgeButton.snp.trailing).offset(47)
            $0.width.height.equalTo(58)
        }
        
        smileLabel.snp.makeConstraints {
            $0.top.equalTo(smileButton.snp.bottom).offset(3)
            $0.centerX.equalTo(smileButton)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
    }
}

