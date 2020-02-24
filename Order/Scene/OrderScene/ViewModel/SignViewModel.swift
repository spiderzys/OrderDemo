//
//  SignatureViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


class SignViewModel: NSObject, ViewModel {
    
    let cityRoute:CityRoute
    
    weak var coordinator: OrderSceneCoordinator?
    weak var delegate: ViewModelRequestDelegate?
    
    init(route: CityRoute) {
        self.cityRoute = route
    }
    
    func sign(image: UIImage) {
        OrderRepository.shared.sign(on: cityRoute, with: image) { (error) in
            if error == nil {
                self.coordinator?.didSigned()
            }
            
            self.delegate?.requestCompleted(error: error)
        }
    }
    
    func cancel() {
        self.coordinator?.back()
    }
    
    
    
}
