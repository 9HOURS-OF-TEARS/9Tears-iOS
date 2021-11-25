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
        case refresh(Int)
    }
    
    enum Mutation {
        case refresh([Post], Int)
        case setLoading(Bool)
    }
    
    struct State {
        var currentIdx = 0
        var postViewSectionItems: [PostViewSectionItem] = []
        var sections: [PostViewSection] {
            let section: [PostViewSection] = [
                .post(self.postViewSectionItems),
            ]
            return section
        }
        
        var isLoading: Bool = false
    }
    
    fileprivate let rankService: RankServiceType
    init(_ steps: PublishRelay<Step>?, rankService: RankServiceType) {
        self.steps = steps ?? PublishRelay<Step>()
        self.initialState = State()
        
        self.rankService = rankService
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .refresh(idx):
            let list = ["daily", "weekly", "monthly", "yearly"]
            
            return Observable.concat([
                
                Observable.just(Mutation.setLoading(true)),
                
                rankService.getPosts("popularity", list[idx]).asObservable()
                    .map { result in
                        switch result {
                        case let .success(posts):
                            return Mutation.refresh(posts.post, idx)
                        case let .error(error):
                            print(error)
                            return Mutation.refresh([], idx)
                        }
                    },
                
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .refresh(posts, idx):
            state.postViewSectionItems.removeAll()
            
            posts.enumerated().forEach {
                state.postViewSectionItems.append(.post(PostListCellReactor(count: $0, idx: $1.id, stickerCount: $1.stickerCount, title: $1.title, writer: $1.nickname, date: $1.createdAt, comment: $1.commentCount, like: $1.likeCount, unlike: $1.dislikeCount)))
            }
            
            state.currentIdx = idx
            
        case let .setLoading(isLoading):
            state.isLoading = isLoading
        }
        
        return state
    }
}


