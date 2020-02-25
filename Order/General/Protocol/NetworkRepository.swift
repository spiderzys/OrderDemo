//
//  NetworkRepository.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Moya

protocol NetworkRepository {
    associatedtype RequestEnum: TargetType
    static var shared:Self {get}
    var netRequestProvider: MoyaProvider<RequestEnum> {get}
    var mockRequestProvider: MoyaProvider<RequestEnum> {get}
    var provider:MoyaProvider<RequestEnum> {get}
    var mockMode:Bool {get}
}

extension NetworkRepository {
    var mockMode:Bool {
        return true
    }
    
    var provider:MoyaProvider<RequestEnum> {
        return mockMode ? mockRequestProvider : netRequestProvider
    }
    
    var mockRequestProvider: MoyaProvider<RequestEnum> {
        return MoyaProvider<RequestEnum>(stubClosure:MoyaProvider.immediatelyStub)
    }
    
    var netRequestProvider: MoyaProvider<RequestEnum> {
        return MoyaProvider<RequestEnum>()
    }
    
    func request(_ type: RequestEnum,  callbackQueue: DispatchQueue = .main, completion:((MoyaError?) -> Void)?) {
        provider.request(type, callbackQueue: callbackQueue) { (result) in
            switch result {
            case.success:
                completion?(nil)
            case .failure(let error):
                completion?(error)
            }
        }
    }
    
    
    
    func request<T:Decodable>(_ type: RequestEnum,  callbackQueue: DispatchQueue = .main, success:((T) -> Void)?, failure: ((MoyaError) -> Void)?) {
        provider.request(type, callbackQueue: callbackQueue) { (result) in
            switch result {
            case.success(let response):
                if let value = try? JSONDecoder().decode(T.self, from: response.data) {
                    success?(value)
                }
                else {
                    failure?(MoyaError.jsonMapping(response))
                }
                
            case .failure(let error):
                failure?(error)
                
            }
            
        }
    }
    
}
