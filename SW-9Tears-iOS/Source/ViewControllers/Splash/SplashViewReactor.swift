//
//  SplashViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class SplashViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case setNextView
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    fileprivate let authService: AuthServiceType
    init(authService: AuthServiceType) {
        self.initialState = State()
        
        self.authService = authService
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setNextView:
            if authService.currentToken == nil {
                self.steps.accept(RankStep.signInIsRequired)
            } else {
                self.steps.accept(RankStep.mainIsRequired)
            }
            return Observable.empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}
