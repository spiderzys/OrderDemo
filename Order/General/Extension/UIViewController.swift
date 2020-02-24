//
//  UIViewController.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit
import Reusable

extension StoryboardSceneBased where Self: UIViewController {
     static var sceneIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    func showAlert(title:String?, message:String?, completion: (() -> Void)? = nil)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: completion)
    }
}



