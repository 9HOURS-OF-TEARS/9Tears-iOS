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

extension Network {
    func requestObject<T: ModelType>(_ target: API, type: T.Type) -> Single<NetworkResultWithValue<T>> {
        let decoder = type.decoder
        return request(target)
            .map { result in
                guard let error = NetworkError(rawValue: result.statusCode) else {
                    let value = try? result.map(T.self, using: decoder)
                    return value == nil ? .error(.unknown) : .success(value!)
                }
                return .error(error)
            }.catchErrorJustReturn(.error(.unknown))
    }
    
    func requestWithoutMapping(_ target: API) -> Single<NetworkResult> {
        return request(target)
            .map { result in
                guard let error = NetworkError(rawValue: result.statusCode) else {
                    return .success
                }
                return .error(error)
            }.catchErrorJustReturn(.error(.unknown))
    }
    
}
