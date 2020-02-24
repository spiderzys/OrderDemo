//
//  LoginViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation


class LoginViewModel: ViewModel {
    weak var coordinator: LoginCoordinator?
    weak var delegate: ViewModelRequestDelegate?
    
    func loginRequest(name:String, password:String) {
        UserRepository.shared.login(name: name, password: password) { (error) in
            self.delegate?.requestCompleted(error:error)
            if error == nil {
                self.authenticationPassed()
            }
           
        }
        
    }
    
    func authenticationPassed() {
        coordinator?.showRoutes()
    }
    
   
    
    
}
