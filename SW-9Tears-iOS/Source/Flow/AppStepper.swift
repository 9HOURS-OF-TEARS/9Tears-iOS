//
//  AppStepper.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import RxFlow
import RxRelay


struct AppSteppeer: Stepper {
    var steps: PublishRelay<Step> = .init()
    
    var initialStep: Step {
        return RankStep.splashIsRequired
    }
}
