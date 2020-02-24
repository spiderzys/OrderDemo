//
//  UIColor.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-22.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit


extension UIColor {
    static var buttonColor: UIColor {
        return UIColor.color(hex: "00BF9C") ?? UIColor.green
    }
    
    static func mapButtonColor(isSigned:Bool) -> UIColor {
        return isSigned ? UIColor.darkGray : UIColor.buttonColor
    }
    
    static func color(hex: String) -> UIColor? {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return nil
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        guard red <= 1, blue <= 1, green <= 1 else {
            return nil
        }
        return UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
