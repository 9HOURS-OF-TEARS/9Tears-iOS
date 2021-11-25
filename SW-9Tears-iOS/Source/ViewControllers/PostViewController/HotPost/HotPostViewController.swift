//
//  HotPostViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit
import WMSegmentControl

final class HotPostViewController: BaseViewController, View {
    
    typealias Reactor = HotPostViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        
    }
    
    fileprivate struct Font {
        
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    let control = WMSegment(frame: .zero).then {
        $0.type = .normal
        $0.isRounded = true
        $0.buttonTitles = "오늘,이번 주,이번 달,이번 해"
        $0.textColor = .black
        $0.selectorTextColor = .white
        $0.selectorColor = UIColor.init(named: "SecondColor")!
        
    }
    
    // MARK: - Inintializing
    init(reactor: Reactor) {
        super.init()
        defer {
            self.reactor = reactor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        self.view.addSubview(self.control)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.control.snp.makeConstraints {
            $0.top.equalToSafeArea(self.view).offset(10)
            $0.height.equalTo(30)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        
        // segment
        self.control.onValueChanged = { [weak self] index in
            guard let self = self else { return }
            _ = Observable.just(Reactor.Action.changeSegment(index))
                .bind(to: reactor.action)
                .disposed(by: self.disposeBag)
        }
        
    }
}

