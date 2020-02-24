//
//  ItemListViewModel.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation


class ItemListViewModel: SingleSectionTableViewModel {
  
    
    weak var delegate: TableViewDelegate?
    
    weak var coordinator: OrderSceneCoordinator?
    let route: CityRoute
    init(route: CityRoute) {
        self.route = route
    }
    
    
    
    var isSigned:Bool {
        return route.signed
    }
    
    var itemList:[Item] = []
    
    var objectList: [Item] {
        return itemList
    }
    
    func requestOrder() {
        OrderRepository.shared.requestOrder(route: route) { (list, error) in
            self.itemList = list ?? []
            self.updateRequestCompleted(error: error)
        }
    }
    
    
    func sign() {
        coordinator?.showSignature(on: route)
    }
    
    
}
