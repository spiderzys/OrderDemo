//
//  RouteRepository.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-21.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Moya


final class RouteRepository {
    static let shared = RouteRepository()
    
    func requestCity(completion: (([City]?, Error?) -> Void)? ) {
       
        request(.city, object: [City].self, success: { (cityList) in
            completion?(cityList, nil)
        }) { (error) in
            completion?(nil, error)
        }
    }
    
    func requestCityRoute(in city:City,completion: (([CityRoute]?, Error?) -> Void)? ) {
       
        request(.cityRoute(city: city), object: [CityRoute].self, success: { (routes) in
            completion?(routes, nil)
        }) { (error) in
            completion?(nil, error)
        }
    }
    
   
    
}


extension RouteRepository:NetworkRepository {
    typealias RequestEnum = RouteRequest
    
    enum RouteRequest: TargetType {
        case city
        case cityRoute(city: City)
        
        var baseURL: URL {
            return URL(string: "https://Route") ?? URL(fileURLWithPath: "")
        }
        
        var path: String {
            return "path"
        }
        
        var method: Method {
            return .get
        }
        
        
        
        var sampleData: Data {
            
            switch self {
            case .city:
                if let mock = try? JSONEncoder().encode(City.mock) {
                    return mock
                }
            case .cityRoute(let city):
                if let mock = try? JSONEncoder().encode(CityRoute.mock.filter{$0.cityId == city.id}) {
                    return mock
                }
            }
            
           
            return Data()
        }
        
        var task: Task {
            return .requestPlain
        }
        
        var headers: [String : String]? {
            return nil
        }
        
        
    }
    
}


