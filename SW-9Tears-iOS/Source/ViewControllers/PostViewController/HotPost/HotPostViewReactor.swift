//
//  HotPostViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class HotPostViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step>
    
    let initialState: State
    
    enum Action {
        case changeSegment(Int)
    }
    
    enum Mutation {
        case refresh(Int)
    }
    
    struct State {
        
    }
    
    init(_ steps: PublishRelay<Step>?) {
        self.steps = steps ?? PublishRelay<Step>()
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .changeSegment(idx):
            return Observable.just(Mutation.refresh(idx))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .refresh(idx):
            break
        }
        
        return state
    }
}


