//
//  Route.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-21.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation


struct City: Codable {
    let id:Int
    let name:String
    
    static let mock: [City]  = [1,2,3].map {
        City(id: $0, name: "city \($0)")
    }
}


struct CityRoute: Codable {
    let orderId: Int
    let name:String
    let address:String
    let cityId: Int
    let signed: Bool
    let routePath: RoutePath
    
    static var mock = City.mock.map { city in
        [1,2,3,4].map {
            CityRoute(orderId :city.id * 10 + $0, name: "Route \($0) in city \(city.id)", address: "address",cityId: city.id, signed: $0 <= 2, routePath: RoutePath.mock)
        }
    }.reduce([],+)
    
    static func mockSign(on route:CityRoute) {
        CityRoute.mock = CityRoute.mock.map {
            $0.orderId == route.orderId ? CityRoute(orderId: $0.orderId, name: $0.name, address: $0.address, cityId: $0.cityId, signed: true, routePath: $0.routePath) : $0
        }
    }
    
}

struct RoutePath: Codable {
    let source: Position
    let destination: Position
    static var mock: RoutePath {
        return RoutePath(source: Position(latitude: 43.6532, longitude: -79.3832), destination: Position(latitude: 43.6535, longitude: -79.40))
    }
}

struct Position: Codable {
    let latitude: Double
    let longitude: Double
}


