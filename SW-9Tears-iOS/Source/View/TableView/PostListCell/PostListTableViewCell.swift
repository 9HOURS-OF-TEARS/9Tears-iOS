//
//  PostListTableViewCell.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit

import ReactorKit

class PostListTableViewCell: UITableViewCell, View {
    
    var disposeBag: DisposeBag = DisposeBag.init()
    
    typealias Reactor = PostListCellReactor
    
    private let stickerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "PostSticker")
        $0.tintColor = UIColor.init(named: "OrangeColor")
    }
    
    private let stickerCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        $0.textColor = UIColor.init(named: "OrangeColor")
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
    }
    
    private let writerLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
    }
    
    private let dateLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 11)
    }
    
    private let commentImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "CommentIcon")
    }
    
    private let commentCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        $0.textColor = .darkGray
    }
    
    private let likeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "LikeIcon")
    }
    
    private let likeCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        $0.textColor = .darkGray
    }
    
    private let unlikeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "UnlikeIcon")
    }
    
    private let unlikeCountLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        $0.textColor = .darkGray
    }
    
    let goldCrown = UIImageView().then {
        $0.image = UIImage(named: "GoldCrown")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    let silverCrown = UIImageView().then {
        $0.image = UIImage(named: "SilverCrown")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    let bronzeCrown = UIImageView().then {
        $0.image = UIImage(named: "BronzeCrown")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpSubViews() {
        self.addSubview(contentView)
        [stickerImageView, goldCrown, silverCrown, bronzeCrown, stickerCountLabel, titleLabel, writerLabel, dateLabel, commentImageView, commentCountLabel,
         likeImageView, likeCountLabel, unlikeImageView, unlikeCountLabel].forEach({ self.contentView.addSubview($0) })
        
        stickerImageView.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.leading.equalTo(10)
            $0.width.height.equalTo(37)
        }
        
        goldCrown.snp.makeConstraints {
            $0.top.equalTo(2)
            $0.leading.equalTo(15)
            $0.width.equalTo(20)
            $0.height.equalTo(15)
        }
        
        silverCrown.snp.makeConstraints {
            $0.top.equalTo(2)
            $0.leading.equalTo(15)
            $0.width.equalTo(20)
            $0.height.equalTo(15)
        }
        
        bronzeCrown.snp.makeConstraints {
            $0.top.equalTo(2)
            $0.leading.equalTo(15)
            $0.width.equalTo(20)
            $0.height.equalTo(15)
        }
        
        stickerCountLabel.snp.makeConstraints {
            $0.top.equalTo(stickerImageView.snp.bottom)
            $0.centerX.equalTo(stickerImageView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.leading.equalTo(stickerImageView.snp.trailing).offset(10)
        }
        
        writerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(-4)
            $0.leading.equalTo(stickerImageView.snp.trailing).offset(10)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(writerLabel.snp.centerY)
            $0.leading.equalTo(writerLabel.snp.trailing).offset(4)
        }
        
        commentImageView.snp.makeConstraints {
            $0.top.equalTo(36)
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(dateLabel.snp.centerY)
        }
        
        commentCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(commentImageView.snp.centerY)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(4)
        }
        
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(36)
            $0.leading.equalTo(commentCountLabel.snp.trailing).offset(6)
            $0.width.height.equalTo(15)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView.snp.centerY)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(4)
        }
        
        unlikeImageView.snp.makeConstraints {
            $0.top.equalTo(36)
            $0.leading.equalTo(likeCountLabel.snp.trailing).offset(6)
            $0.width.height.equalTo(15)
        }
        
        unlikeCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(unlikeImageView.snp.centerY)
            $0.leading.equalTo(unlikeImageView.snp.trailing).offset(4)
            $0.trailing.equalTo(-20)
        }
        
        
    }
    
    // MARK: - Configuring
    
    func bind(reactor: Reactor) {
        reactor.state.map { "\($0.stickerCount)" }.asObservable()
            .distinctUntilChanged()
            .bind(to: stickerCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.title }.asObservable()
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.writer }.asObservable()
            .distinctUntilChanged()
            .bind(to: writerLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.date.viewString }.asObservable()
            .distinctUntilChanged()
            .bind(to: dateLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { "\($0.comment)" }.asObservable()
            .distinctUntilChanged()
            .bind(to: commentCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { "\($0.like)" }.asObservable()
            .distinctUntilChanged()
            .bind(to: likeCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { "\($0.unlike)" }.asObservable()
            .distinctUntilChanged()
            .bind(to: unlikeCountLabel.rx.text)
            .disposed(by: disposeBag)
    }

}
