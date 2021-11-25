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
    
    private let titleLabel = UILabel().then {
        $0.text = "내 게시글"
        $0.font = .init(name: "NotoSansKR-Regular", size: 20)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(21)
            $0.centerX.equalToSuperview()
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
