//
//  MapViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

class MapViewModel: ViewModel {
    weak var coordinator: RouteSceneCoordinator?
    let route:CityRoute
    
    init(route: CityRoute) {
        self.route = route
    }
    
    
}


