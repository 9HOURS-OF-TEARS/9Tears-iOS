//
//  RankViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit
import Tabman
import Pageboy

class RankViewController: TabmanViewController {
    
    fileprivate struct TabBarItems {
        static let viewControllers = [
            RankPostViewController(reactor: RankPostViewReactor()),
            RankCommentViewController(reactor: RankCommentViewReactor())
        ]
        static let titles: Array<String> = ["예쁜 글 작성자", "예쁜 댓글 작성자"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension RankViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return TabBarItems.viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return TabBarItems.viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = TabBarItems.titles[index]
        return TMBarItem(title:title)
    }
}
