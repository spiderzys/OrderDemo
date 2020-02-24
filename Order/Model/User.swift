//
//  User.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-21.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

struct User:Codable {
    let name:String
    let id:String
    let accessToken:String
    static let mock = User(name: "name", id: "1", accessToken:"mockToken")
}


