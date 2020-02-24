//
//  RouteSceneCoordinator.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


class RouteSceneCoordinator: NSObject, NavigationCooordinator {
    let root: UINavigationController
    
    func start() {
        root.delegate = self
        let viewController = CityListViewController.instantiate()
        let viewModel = CityListViewModel()
        viewModel.coordinator = self
        viewModel.delegate = viewController
        viewController.viewModel = viewModel
        
        self.root.pushViewController(viewController, animated: true)
    }
    
    func showRoutes(in city: City) {
        let routeListViewController = RouteListViewController.instantiate()
        routeListViewController.title = "\(city.name) route plan"
        let viewModel = RouteListViewModel(city: city)
        routeListViewController.viewModel = viewModel
        viewModel.delegate = routeListViewController
        viewModel.coordinator = self
        self.root.pushViewController(routeListViewController, animated: true)
    }
    
    func showRoute(_ route: CityRoute) {
        let mapViewModel = MapViewModel(route: route)
        let viewController = MapViewController.instantiate()
        viewController.viewModel = mapViewModel
        mapViewModel.coordinator = self
        self.root.pushViewController(viewController, animated: true)
    }
    
    func showOrder(on route: CityRoute) {
        let orderCoordiantor = OrderSceneCoordinator(root: root, for: route)
        self.childCoordinators.append(orderCoordiantor)
        orderCoordiantor.parentCoordinator = self
        orderCoordiantor.start()
    }
    
    init(root:UINavigationController) {
        self.root = root
    }
    
  
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let _ = viewController as? LoginViewController, let parent = parentCoordinator as? LoginCoordinator{
            navigationController.delegate = parent
            parentCoordinator?.childDidEnd(self)
        }
    }
}


