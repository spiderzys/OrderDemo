//
//  RouteViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation


class CityListViewModel: SingleSectionTableViewModel {
   
    
    typealias ObjectType = City

    weak var coordinator: RouteSceneCoordinator?
    weak var delegate: TableViewDelegate?
    private var cityList: [City] = []
      
    var objectList: [City] {
        return cityList
    }
    
    func signOut() {
        UserRepository.shared.signOut { (error) in
            self.coordinator?.back()
        }
    }
    
    func showRoutes(in city: City) {
        coordinator?.showRoutes(in: city)
    }
    
    func requestCity() {
        RouteRepository.shared.requestCity { (cityList, error) in
            if let list = cityList {
                self.cityList = list
            }
            self.delegate?.requestCompleted(error: error)
        }
    }
    
    deinit {
        print(self)
    }
    
    
    
   
    
    
    

}

