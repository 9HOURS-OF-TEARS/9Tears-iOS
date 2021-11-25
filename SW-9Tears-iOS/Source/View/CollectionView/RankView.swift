//
//  RankView.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit
import SnapKit
import Then

class RankView: UIView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.left.right.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
