//
//  RankPostViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit
import ReactorKit

class RankPostViewController: BaseViewController, View {
    
    typealias Reactor = RankPostViewReactor
    
    let cell = RankCollectionViewCell()
    
    private lazy var rankView = RankView.init(frame: self.view.frame)
    
    private func setupCollectionView() {
        rankView.collectionView.delegate = self
        rankView.collectionView.dataSource = self
        rankView.collectionView.register(RankCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
    }
    
    init(reactor: Reactor) {
        super.init()
        defer {
            self.reactor = reactor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rankView
        setupCollectionView()
    }

    func bind(reactor: RankPostViewReactor) {
        
    }
    
}

extension RankPostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? RankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.stickerImageView.image = UIImage(named: "PostSticker")
        cell.stickerImageView.tintColor = UIColor.init(named: "OrangeColor")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 300, height: 300)
    }
    
}

