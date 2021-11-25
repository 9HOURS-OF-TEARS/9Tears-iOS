//
//  SignFlow.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation

import RxFlow

class SignFlow: Flow {
    
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
        case .signInIsRequired:
            return navigateToSignIn()
            
        case .signUpIsRequired:
            return navigateToSignUp()
            
        case .mainIsRequired:
            return .end(forwardToParentFlowWithStep: RankStep.mainIsRequired)
            
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

extension SignFlow {
    
    private func navigateToSignIn() -> FlowContributors {
        let reactor = SignInViewReactor(authService: services.authService)
        let viewController = SignInViewController(reactor: reactor)

        self.rootViewController.pushViewController(viewController, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
    private func navigateToSignUp() -> FlowContributors {
        let reactor = SignUpViewReactor()
        let viewController = SignUpViewController(reactor: reactor)

        self.rootViewController.pushViewController(viewController, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
}
