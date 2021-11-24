//
//  Network.swift
//  9Tears-iOS
//
//  Created by 김부성 on 2021/11/24.
//

import Foundation

import RxSwift
import Moya

class Network<API: TargetType>: MoyaProvider<API> {
    
    init(plugins: [PluginType] = []) {
        let session = MoyaProvider<API>.defaultAlamofireSession()
        // set Timeout
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        
        super.init(session: session, plugins: plugins)
    }
    
    func request(_ api: API) -> Single<Response> {
        return self.rx.request(api)
            .filter(statusCodes: 200...500)
    }
}
