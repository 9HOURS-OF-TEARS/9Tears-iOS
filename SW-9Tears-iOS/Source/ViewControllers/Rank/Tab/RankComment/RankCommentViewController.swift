//
//  RankCommentViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit
import ReactorKit

class RankCommentViewController: BaseViewController, View {
    
    typealias Reactor = RankCommentViewReactor
    
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

        // Do any additional setup after loading the view.
    }
    
    func bind(reactor: RankCommentViewReactor) {
        
    }
}
