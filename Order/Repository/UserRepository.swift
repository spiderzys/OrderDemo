//
//  UserRepository.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Moya

final class UserRepository {
    static let shared = UserRepository()
    var currentUser:User?
}


extension UserRepository: NetworkRepository {
    
    func signOut(completion: ((Error?) -> Void)?) {
        request(.logout) { (error) in
            completion?(error)
        }
    }
  
    
    func login(name:String, password:String, completion: ((Error?) -> Void)?) {
        request(.login(name: name, password: password), object: User.self, success: { (user) in
            self.currentUser = user
            completion?(nil)
        }) { (error) in
            completion?(error)
        }
    }
   
    typealias RequestEnum = AccessRequest
    enum AccessRequest:TargetType {
    
        
        case login(name: String, password:String)
        case logout
        
        
        public var sampleData: Data {
            switch self {
            case .login:
                let mockUserData = try? JSONEncoder().encode(User.mock)
                return mockUserData ?? Data()
            case .logout:
                return Data()
            
            }
        }
        
        
        public var task: Task {
            switch self {
            case .login(let name, let password):
                return .requestParameters(parameters: ["name":name, "password":password], encoding: JSONEncoding.default)
            case .logout:
                return .requestPlain
            }
        }
        
        public var baseURL: URL {
            switch self {
            case .login:
                return URL(string: "https://loginUrl") ?? URL(fileURLWithPath: "")
            case .logout:
                return URL(string: "https://logOutUrl") ??  URL(fileURLWithPath: "")
            }
        }
        
        public var path: String {
            return ""
        }
        
        public var method: Method {
            return .get
        }
        
        
        
        public var headers: [String : String]? {
            return ["Content-type": "application/json"]
        }
    }
    
    
    
    
    
    
    
    
}


