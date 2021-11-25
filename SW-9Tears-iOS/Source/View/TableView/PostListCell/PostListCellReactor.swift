//
//  PostListCellReactor.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import ReactorKit
import RxRelay
import RxFlow

final class PostListCellReactor: Reactor, Stepper {
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    let initialState: State
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var idx: Int
        var stickerCount: Int
        var title: String
        var writer: String
        var date: Date
        var comment: Int
        var like: Int
        var unlike: Int
    }
    
    init(idx: Int, stickerCount: Int, title: String, writer: String, date: Date, comment: Int, like: Int, unlike: Int) {
        self.initialState = State(idx: idx, stickerCount: stickerCount, title: title, writer: writer, date: date, comment: comment, like: like, unlike: unlike)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}
