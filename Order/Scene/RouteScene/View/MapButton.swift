//
//  RouteButton.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit
import Reusable

class MapButton: UIButton, NibLoadable {
    
    func configuraState(isSigned:Bool) {
        self.backgroundColor = isSigned ? UIColor.darkGray : UIColor.buttonColor
        self.setTitle(isSigned ? "Signed" : "Map", for: .normal)
   
       
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
