//
//  RankService.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

import RxSwift

protocol RankServiceType: AnyObject {
    func getPosts(_ criterion: String, _ duration: String) -> Single<NetworkResultWithValue<Posts>>
}
          
final class RankService: RankServiceType {
    
    fileprivate let network: Network<RankAPI>
    
    init(network: Network<RankAPI>) {
        self.network = network
    }
    
    func getPosts(_ criterion: String, _ duration: String) -> Single<NetworkResultWithValue<Posts>> {
        return network.requestObject(.getList(criterion, duration), type: Posts.self)
    }
    
}
