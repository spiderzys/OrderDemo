//
//  OrderSceneCoordinator.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Reusable


class OrderSceneCoordinator: NSObject, NavigationCooordinator {
    
    
    let root: UINavigationController
    private var route: CityRoute
    
    func start() {
        root.delegate = self
        let itemListViewController = ItemListViewController.instantiate()
        let viewModel = ItemListViewModel(route: route)
        viewModel.delegate = itemListViewController
        viewModel.coordinator = self
        itemListViewController.viewModel = viewModel
        root.pushViewController(itemListViewController, animated: true)
    }
    
   
    func showSignature(on cityRoute: CityRoute) {
        let viewController = SignViewController.instantiate()
        let viewModel = SignViewModel(route: cityRoute)
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        viewController.modalPresentationStyle = .fullScreen
        root.present(viewController, animated: true)
    }
    
    func showAdjust(item: Item) {
        let viewController = ItemViewController.instantiate()
        let viewModel = ItemViewModel(item: item)
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        root.pushViewController(viewController, animated: true)
    }
    
    init(root:UINavigationController, for route: CityRoute) {
        self.root = root
        self.route = route
    }
    
    func didSigned() {
        self.root.popViewController(animated: true)
        if let viewController = root.presentedViewController as? SignViewController{
            viewController.dismiss(animated: true, completion: nil)
        }
      
    }
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let _ = viewController as? RouteListViewController, let parent = parentCoordinator as? RouteSceneCoordinator{
            navigationController.delegate = parent
            parentCoordinator?.childDidEnd(self)
        }
    }
    
    
}
