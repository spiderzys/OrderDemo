//
//  OrderSceneProtocolswift.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Reusable


protocol OrderSceneVC: StoryboardSceneBased  {}
extension OrderSceneVC where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: "OrderScene", bundle: nil)
    }
}
