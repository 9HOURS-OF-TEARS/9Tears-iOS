//
//  RankPostViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 장서영 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class RankPostViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}
