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
        case updateId(String)
        case updatePw(String)
    }
    
    enum Mutation {
        case setLoading(Bool)
        case updateId(String)
        case updatePw(String)
    }
    
    struct State {
        var id: String = ""
        var password: String = ""
        var isLoading: Bool = false
    }
    
    fileprivate let authService: AuthServiceType
    init(authService: AuthServiceType) {
        self.initialState = State()
        
        self.authService = authService
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .signUp:
            self.steps.accept(RankStep.signUpIsRequired)
            return Observable.empty()
            
        case .signIn:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                
                self.authService.signIn(self.currentState.id, self.currentState.password)
                    .map { result in
                        switch result {
                        case .success:
                            self.steps.accept(RankStep.mainIsRequired)
                        case let .error(error):
                            print(error)
                        }
                    }.asObservable().flatMap { _ in Observable.empty() },
                
                Observable.just(Mutation.setLoading(false))
            ])
            
        case let .updateId(id):
            return Observable.just(Mutation.updateId(id))
            
        case let .updatePw(password):
            return Observable.just(Mutation.updatePw(password))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .setLoading(isLoading):
            state.isLoading = isLoading
             
        case let .updateId(id):
            state.id = id
            
        case let .updatePw(password):
            state.password = password
        }
        
        return state
    }
}


