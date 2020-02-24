//
//  Canvas.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-24.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    // public function
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    var signed = false
    
    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
        signed = false
    }
    
    fileprivate var lines = [Line]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        signed = true
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
}

extension Canvas {
    var signatureImage:UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
           defer { UIGraphicsEndImageContext() }
           if let context = UIGraphicsGetCurrentContext() {
               self.layer.render(in: context)
               let image = UIGraphicsGetImageFromCurrentImageContext()
               return image
           }
           return nil
    }
}




struct Line {
    let strokeWidth: Float
    let color: UIColor
    var points: [CGPoint]
}
