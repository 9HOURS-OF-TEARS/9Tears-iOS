//
//  AppFlow.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import RxFlow

class AppFlow: Flow {
    
    private let window: UIWindow
    private let services: AppServices
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow, services: AppServices) {
        self.window = window
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? RankStep else { return .none }
        
        switch step {
        case .splashIsRequired:
            return navigateToIntro()
            
        case .signInIsRequired:
            return navigateToSignIn()
            
        case .mainIsRequired:
            return .none
            
        default:
            return .none
            
        }
    }
    
}

extension AppFlow {
    
    private func navigateToIntro() -> FlowContributors {
        let introFlow = SplashFlow(services)

        Flows.use(introFlow, when: .created) { [unowned self] root in
            self.window.rootViewController = root

            UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)

        }

        return .one(flowContributor: .contribute(withNextPresentable: introFlow, withNextStepper: OneStepper(withSingleStep: RankStep.splashIsRequired)));
    }
    
    private func navigateToSignIn() -> FlowContributors {
        let signFlow = SignFlow(services)

        Flows.use(signFlow, when: .created) { [unowned self] root in
            self.window.rootViewController = root

            UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)

        }

        return .one(flowContributor: .contribute(withNextPresentable: signFlow, withNextStepper: OneStepper(withSingleStep: RankStep.signInIsRequired)));
    }
//
//    private func navigateToMain() -> FlowContributors {
//        let homeFlow = HomeFlow(services)
//
//        Flows.use(homeFlow, when: .created) { [unowned self] root in
//            self.window.rootViewController = root
//
//            UIView.transition(with: self.window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
//
//        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: RankStep.mainIsRequired)))
//    }
}
