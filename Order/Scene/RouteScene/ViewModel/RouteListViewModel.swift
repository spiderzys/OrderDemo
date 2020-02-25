//
//  RouteListViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation

class RouteListViewModel: SingleSectionTableViewModel {
    
    
    typealias ObjectType = CityRoute
    init(city:City) {
        self.city = city
    }
    var objectList: [CityRoute] {
        return routes
    }
    var delegate: TableViewDelegate?
    let city:City
    weak var coordinator: RouteSceneCoordinator?
    
    private (set) var routes:[CityRoute] = []
    
    func requestRoute() {
        RouteRepository.shared.requestCityRoute(in: city) { (routes, error) in
            if let routes = routes {
                self.routes = routes
            }
            self.delegate?.requestCompleted(error: error)
        }
    }
    
    func showOrder(on Route:CityRoute) {
        coordinator?.showOrder(on: Route)
    }
    
   
    
    
}
