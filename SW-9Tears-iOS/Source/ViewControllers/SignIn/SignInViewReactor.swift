//
//  SignInViewReactor.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class SignInViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case signUp
        case signIn
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .signUp:
            self.steps.accept(RankStep.signUpIsRequired)
            return Observable.empty()
            
        case .signIn:
            self.steps.accept(RankStep.mainIsRequired)
            return  Observable.empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}


