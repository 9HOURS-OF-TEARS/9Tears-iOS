//
//  RankViewController.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import UIKit

import Tabman
import Pageboy
import ReactorKit

class RankViewController: TabmanViewController, View {
    var disposeBag: DisposeBag = DisposeBag()
    
    typealias Reactor = RankViewReactor
    
    fileprivate struct TabBarItems {
        static let viewControllers = [
            RankPostViewController(reactor: RankPostViewReactor()),
            RankCommentViewController(reactor: RankCommentViewReactor())
        ]
        static let titles: Array<String> = ["예쁜 글 작성자", "예쁜 댓글 작성자"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        addBar(bar, dataSource: self, at: .top)
    }
    
    let bar = TMBar.ButtonBar().then {
        $0.layout.transitionStyle = .snap
        $0.backgroundView.style = .clear
        $0.layout.contentMode = .fit
        $0.indicator.overscrollBehavior = .bounce
        $0.indicator.tintColor = UIColor(named: "FourthMainColor")
        $0.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        $0.buttons.customize {
            $0.tintColor = UIColor(named: "DisabledColor")
            $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)!
            $0.selectedTintColor = .black
        }
    }
    
    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        
        defer { self.reactor = reactor }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: Reactor) {
        
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
