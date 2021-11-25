//
//  NewPostViewReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class NewPostViewReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        case refresh
    }
    
    enum Mutation {
        case refresh
    }
    
    struct State {
        var postViewSectionItems: [PostViewSectionItem] = []
        var sections: [PostViewSection] {
            let section: [PostViewSection] = [
                .post(self.postViewSectionItems),
            ]
            return section
        }
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            return Observable.just(Mutation.refresh)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .refresh:
            state.postViewSectionItems.removeAll()
            
            for i in 0...5 {
                state.postViewSectionItems.append(.post(PostListCellReactor(idx: i, stickerCount: 1, title: "안녕", writer: "익명", date: Date(), comment: i, like: 4, unlike: 5)))
            }
        }
        
        return state
    }
}

