//
//  RouteSceneProtocol.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Reusable


protocol RouteSceneVC: StoryboardSceneBased  {}
extension RouteSceneVC where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: "RouteScene", bundle: nil)
    }
}


