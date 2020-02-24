


import UIKit

protocol Coordinator: AnyObject {
    func start()
    var childCoordinators:[Coordinator] {get set}
    var parentCoordinator:Coordinator? {get set}
    
}


extension Coordinator {
    
    func childDidEnd(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

protocol NavigationCooordinator:Coordinator, UINavigationControllerDelegate {
    var root: UINavigationController {get}
}

extension NavigationCooordinator {
    func back() {
        if let viewController = root.presentedViewController {
            viewController.dismiss(animated: true, completion: nil)
        }
        else {
            root.popViewController(animated: true)
        }
    }
    
    
}
