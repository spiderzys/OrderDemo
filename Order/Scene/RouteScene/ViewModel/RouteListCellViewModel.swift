//
//  RouteListCellViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

class RouteListCellViewModel:NSObject, SingleSectionCellViewModel {
    
    
    var object: CityRoute
    
    required init(object: CityRoute) {
        self.object = object
    }
    
    weak var coordinator:RouteSceneCoordinator?
    
    func showRoute() {
        if !object.signed{
            coordinator?.showRoute(object)
        }
        
    }
    
    
    
    
}
