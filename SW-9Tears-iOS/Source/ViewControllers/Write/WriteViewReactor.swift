//
//  WriteViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class WriteViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case updateTitle(String)
        case updateContents(String)
        case write
    }
    
    enum Mutation {
        case updateTitle(String)
        case updateContents(String)
        case setLoading(Bool)
    }
    
    struct State {
        var title: String = ""
        var contents: String = ""
        var isLoading: Bool = false
    }
    
    let rankService: RankServiceType
    init(rankService: RankServiceType) {
        self.initialState = State()
        
        self.rankService = rankService
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .write:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                
                rankService.createPost(currentState.title, currentState.contents)
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
            
        case let .updateTitle(title):
            return Observable.just(Mutation.updateTitle(title))
            
        case let .updateContents(contents):
            return Observable.just(Mutation.updateContents(contents))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .updateTitle(title):
            state.title = title
            
        case let .updateContents(contents):
            state.contents = contents
            
        case let .setLoading(isLoading):
            state.isLoading = isLoading
        }
        
        return state
    }
}

