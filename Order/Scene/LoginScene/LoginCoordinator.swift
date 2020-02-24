//
//  LoginCoordinator.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


class LoginCoordinator:NSObject, NavigationCooordinator {
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    
    let root: UINavigationController
    
    func start() {
        root.delegate = self
        let viewController = LoginViewController.instantiate()
        let viewModel = LoginViewModel()
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.delegate = viewController
        root.pushViewController(viewController, animated: false)
    }
    
    func showRoutes() {
        let coordinator = RouteSceneCoordinator(root: self.root)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    init(root:UINavigationController) {
        self.root = root
        
    }
    
    
  
}



