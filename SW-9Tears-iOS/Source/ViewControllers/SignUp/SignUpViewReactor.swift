//
//  SignUpViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class SignUpViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case signUp
        case checkNickname
        case checkId
        case updateNickname(String)
        case updateId(String)
        case updatePw(String)
    }
    
    enum Mutation {
        case setLoading(Bool)
        case updateNickname(String)
        case updateId(String)
        case updatePw(String)
    }
    
    struct State {
        var nickname: String = ""
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
        case let .updateNickname(nickname):
            return Observable.just(Mutation.updateNickname(nickname))
            
        case let .updateId(id):
            return Observable.just(Mutation.updateId(id))
            
        case let .updatePw(password):
            return Observable.just(Mutation.updatePw(password))
            
        case .signUp:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                
                self.authService.signUp(self.currentState.id, self.currentState.password, self.currentState.nickname)
                    .map { result in
                        switch result {
                        case .success:
                            self.steps.accept(RankStep.popViewController)
                        case let .error(error):
                            print(error)
                        }
                    }.asObservable().flatMap { _ in Observable.empty() },
                
                Observable.just(Mutation.setLoading(false))
            ])

        case .checkNickname:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                
                self.authService.verifyNickname(self.currentState.nickname)
                    .map { result in
                        switch result {
                        case .success:
                            print("success")
                        case let .error(error):
                            print(error)
                        }
                    }.asObservable().flatMap { _ in Observable.empty() },
                
                Observable.just(Mutation.setLoading(false))
            ])
            
        case .checkId:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                
                self.authService.verifyId(self.currentState.id)
                    .map { result in
                        switch result {
                        case .success:
                            print("success")
                        case let .error(error):
                            print(error)
                        }
                    }.asObservable().flatMap { _ in Observable.empty() },
                
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .setLoading(isLoading):
            state.isLoading = isLoading
             
        case let .updateNickname(nickname):
            state.nickname = nickname
            
        case let .updateId(id):
            state.id = id
            
        case let .updatePw(password):
            state.password = password
        }
        
        return state
    }
}


