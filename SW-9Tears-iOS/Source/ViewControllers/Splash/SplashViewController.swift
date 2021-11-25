//
//  SplashViewController.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import UIKit

import ReactorKit

final class SplashViewController: BaseViewController, View {
    
    typealias Reactor = SplashViewReactor
    
    // MARK: - Constants
    fileprivate struct Metric {
        
    }
    
    fileprivate struct Font {
        
    }
    
    fileprivate struct Style {
        
    }
    
    // MARK: - Properties
    
    // MARK: - UI
    
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
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
    }
    
    // MARK: - Configuring
    func bind(reactor: Reactor) {
        self.rx.viewDidAppear.asObservable()
            .map { _ in Reactor.Action.setNextView }
            .delay(.seconds(1), scheduler: MainScheduler.instance)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

