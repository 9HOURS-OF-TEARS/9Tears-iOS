//
//  PostViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class PostViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case write
        case rank
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
        case .write:
            self.steps.accept(RankStep.writeIsRequired)
            return Observable.empty()
            
        case .rank:
            self.steps.accept(RankStep.rankIsRequired)
            return Observable.empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}


