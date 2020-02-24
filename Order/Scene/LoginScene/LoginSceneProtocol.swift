//
//  LoginSceneVC.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-20.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Reusable

protocol LoginSceneVC: StoryboardSceneBased  {}
extension LoginSceneVC where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: "LoginScene", bundle: nil)
    }
    
}


