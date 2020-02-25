//
//  CartRepository.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Moya

final class OrderRepository {
    static let shared = OrderRepository()
    
}

extension OrderRepository:NetworkRepository {
    typealias RequestEnum = OrderRequest
    
    enum ItemUpdateAction {
        case update(item:Item)
        case delete(item:Item)
    }
    
    func requestOrder(route: CityRoute, completion:(([Item]?, Error?) -> Void)? ) {
        guard let user = UserRepository.shared.currentUser else {return}
        request(.requestOrder(user: user, route: route), success: { itemList in
            completion?(itemList, nil)
        }) { (error) in
            completion?(nil, error)
        }
    }
    
    func updateItem(action :ItemUpdateAction, completion: ((Error?) -> Void)?) {
        if mockMode {
            Item.updateMock(action: action)
        }
        guard let user = UserRepository.shared.currentUser else {return}
        request(.updateItem(user: user, action: action), completion: completion)
        
    }
    
    func sign(on cityRoute: CityRoute , with image:UIImage, completion: ((Error?) -> Void)?) {
        if mockMode {
            CityRoute.mockSign(on: cityRoute)
        }
        guard let user = UserRepository.shared.currentUser else {return}
        request(.sign(user: user, route: cityRoute, image: image), completion: completion)
    }
    
    
    enum OrderRequest:TargetType {
        case requestOrder(user:User , route:CityRoute)
        case updateItem(user:User , action: ItemUpdateAction)
        case sign(user:User, route:CityRoute, image:UIImage)
        
        var baseURL: URL {
            return URL(fileURLWithPath: "")
        }
        
        var path: String {
            switch self {
            case .requestOrder:
                return "request"
            case .updateItem:
                return "update"
            case .sign:
                return ""
            }
        }
        
        var method: Method {
            switch self {
            case .requestOrder:
                return .get
            default:
                return .post
            }
        }
        
        var sampleData: Data {
            switch self {
            case .requestOrder( _, let route):
                if let mock = try? JSONEncoder().encode(Item.mock.filter {route.orderId == $0.orderId}) {
                     return mock
                }
               
            default:
                break
            }
            return Data()
        }
        
        var task: Task {
            switch self {
            case .requestOrder(let user, let route):
                return .requestParameters(parameters: ["userId": user.id, "routeId": route.orderId], encoding: JSONEncoding.default)
            case .updateItem:
                return .requestPlain
            case .sign:
                return .uploadMultipart([])
            }
        }
        
        var headers: [String : String]? {
            switch self {
            case .requestOrder(let user, _):
                return ["accessToken": user.accessToken]
            case .updateItem( let user, _):
                return ["accessToken": user.accessToken]
            case .sign( let user, _, _):
            return ["accessToken": user.accessToken]
            }
            
        }
        
        
        
    }
}
