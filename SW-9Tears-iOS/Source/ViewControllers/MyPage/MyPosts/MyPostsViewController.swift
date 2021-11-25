//
//  MyPostsViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/26.
//

import UIKit
import SnapKit
import Then

class MyPostsViewController: UIViewController {
    
    private let backButton = UIButton(type: .system).then {
        $0.setImage(.init(named: "BackButton"), for: .normal)
        $0.tintColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "내 게시글"
        $0.font = .init(name: "NotoSansKR-Regular", size: 20)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(titleLabel)
        self.view.addSubview(backButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(21)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(25)
            $0.top.equalTo(26)
            $0.leading.equalTo(24)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
