//
//  UIView+Extensions.swift
//  TasksManagerApp
//
//  Created by Oxana Lobysheva on 28/01/2020.
//  Copyright © 2020 TEAM (Lobysheva and Tolstikov and Semerikov). All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    private static let lineDashPattern: [NSNumber] = [7, 2]
    private static let lineDashWidth: CGFloat = 1.0
    
    func makeDashedBorderLine() {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = UIView.lineDashWidth
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = UIView.lineDashPattern
        path.addLines(between: [CGPoint(x: bounds.minX+10, y: bounds.height-10),
                                CGPoint(x: bounds.maxX-10, y: bounds.height-10)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
