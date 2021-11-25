//
//  RankCollectionViewCell.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit
import SnapKit
import Then

class RankCollectionViewCell: UICollectionViewCell {
    
    private let mainView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 6
    }
    
    let titleLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 30)
        $0.text = "asdfasdf"
    }
    
    let stickerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "PostSticker")
    }
    
    private let stickerCountLabel = UILabel().then  {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25)
        $0.text = "5"
    }
    
    private let rankerNameLabel = UILabel().then  {
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 32)
        $0.text = "asdfasdf"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        addSubview(mainView)
        
        [titleLabel, stickerImageView, stickerCountLabel, rankerNameLabel].forEach({ mainView.addSubview($0) })
        
        mainView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainView).offset(20)
            $0.centerY.equalTo(mainView)
        }
        
        stickerImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.centerY.equalTo(mainView)
            $0.width.height.equalTo(96)
        }
        
        stickerCountLabel.snp.makeConstraints {
            $0.top.equalTo(stickerImageView.snp.bottom).offset(8)
            $0.centerY.equalTo(mainView)
        }
        
        rankerNameLabel.snp.makeConstraints {
            $0.top.equalTo(stickerCountLabel.snp.bottom).offset(15)
            $0.centerY.equalTo(mainView)
        }
    }
}
