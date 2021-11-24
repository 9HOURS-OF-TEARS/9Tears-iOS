//
//  RankStep.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import RxFlow

enum RankStep: Step {
    case dismiss
    case popViewController
    case popToRootViewController
    
    // MARK: - Intro
    case splashIsRequired
    case signInIsRequired
    case signUpIsRequired
    
    // MARK: - Main
    case mainIsRequired
}
