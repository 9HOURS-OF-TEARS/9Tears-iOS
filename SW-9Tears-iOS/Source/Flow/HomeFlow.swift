//
//  HomeFlow.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import RxFlow

class HomeFlow: Flow {
    
    private let services: AppServices
    
    var root: Presentable {
        return self.rootViewController
    }
    
    let navigationAppearance = UINavigationBarAppearance().then {
        $0.configureWithTransparentBackground()
    }
    
    private lazy var rootViewController = UINavigationController().then {
        $0.navigationBar.standardAppearance = navigationAppearance
    }
    
    init(_ services: AppServices) {
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? RankStep else { return .none }
        
        switch step {
        case .mainIsRequired:
            return navigateToMain()
            
        case .dismiss:
            self.rootViewController.dismiss(animated: true, completion: nil)
            return .none
            
        case .popViewController:
            self.rootViewController.popViewController(animated: true)
            return .none
            
        default:
            return .none
        }
    }
    
    
}

extension HomeFlow {
    
    private func navigateToMain() -> FlowContributors {
        let reactor = PostViewReactor()
        let viewController = PostViewController(reactor: reactor)

        self.rootViewController.pushViewController(viewController, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
}

