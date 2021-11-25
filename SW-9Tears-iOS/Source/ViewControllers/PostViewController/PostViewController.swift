//
//  PostViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import Tabman
import Pageboy
import ReactorKit

class PostViewController: TabmanViewController, View {
    var disposeBag: DisposeBag = DisposeBag()
    
    typealias Reactor = PostViewReactor
    
    // MARK: - Constants
    fileprivate struct TabBarItems {
        static let titles: Array<String> = ["최신 글", "인기 글"]
    }
    
    fileprivate struct Metric {
        // Write Button
        static let buttonMargin = 20.f
        static let buttonSize = 50.f
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let bar = TMBar.ButtonBar().then {
        $0.layout.transitionStyle = .snap
        $0.backgroundView.style = .clear
        $0.layout.contentMode = .fit
        $0.indicator.tintColor = UIColor.init(named: "SecondColor")
        $0.buttons.customize {
            $0.tintColor = UIColor.init(named: "DisabledColor")
            $0.selectedTintColor = .black
        }
    }
    
    let writeButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor.init(named: "SecondColor")
        $0.tintColor = .white
        $0.setImage(UIImage.init(named: "PlusIcon"), for: .normal)
        $0.layer.cornerRadius = Metric.buttonSize / 2
        $0.clipsToBounds = true
    }
    
    let rankButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor.init(named: "SecondColor")
        $0.tintColor = .white
        $0.setImage(UIImage.init(named: "TrophyIcon"), for: .normal)
        $0.layer.cornerRadius = Metric.buttonSize / 2
        $0.clipsToBounds = true
    }
    
    // MARK: - Inintializing
    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        
        defer {
            self.reactor = reactor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
    
    override func viewWillLayoutSubviews() {
        self.view.addSubview(self.writeButton)
        self.view.addSubview(self.rankButton)
        
        self.writeButton.snp.makeConstraints {
            $0.right.bottom.equalToSafeArea(self.view).offset(-Metric.buttonMargin)
            $0.width.height.equalTo(Metric.buttonSize)
        }
        
        self.rankButton.snp.makeConstraints {
            $0.right.equalTo(self.writeButton.snp.left).offset(-Metric.buttonMargin)
            $0.bottom.equalToSafeArea(self.view).offset(-Metric.buttonMargin)
            $0.width.height.equalTo(Metric.buttonSize)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
    }
}

// MARK: - Extension
extension PostViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        let viewControllers = [
            NewPostViewController(reactor: NewPostViewReactor(self.reactor?.steps)),
            UIViewController()
        ]

        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = TabBarItems.titles[index]
        return TMBarItem(title: title)
    }
}
