//
//  Order.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-21.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation



struct Item: Codable {
    let orderId: Int
    let id: Int
    var quantity: Int
    let name:String
    let spec:String
    
    enum CodingKeys:String,CodingKey {
        case orderId = "order_id"
        case id
        case quantity
        case name = "item_name"
        case spec
    }
    
    static var mock: [Item] = CityRoute.mock.map { cityRoute in
        [1,2,3,4,5].map {
            Item(orderId: cityRoute.orderId, id: $0  + cityRoute.orderId * 10, quantity: $0 * 10, name: "item \($0)", spec: "1kg")
        }
    }.reduce([],+)
    
    static func updateMock(action: OrderRepository.ItemUpdateAction) {
        switch action {
        case .delete(let item):
            Item.mock = Item.mock.filter{ !($0.id == item.id )}
            
        case .update(let item):
            Item.mock = Item.mock.map {
                $0.id == item.id ? Item(orderId: $0.orderId, id: $0.id, quantity: item.quantity, name: $0.name, spec: $0.spec) : $0
            }
        }
    }
    
    
}

