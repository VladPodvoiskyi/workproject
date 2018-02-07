//
//  ViewsExtension.swift
//  Eredivisie
//
//  Created by user on 1/31/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackgroundUniversal(colors: [CGColor], start: CGPoint = CGPoint(x: 0, y: 0), end: CGPoint = CGPoint(x: 0, y: 1)) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        var doublesArray = [NSNumber]()
        var i = -1.0
        for _ in colors {
            i += 1.0
            let count = Double(colors.count - 1)
            let double = Double(i / count)
            let number = NSNumber(value: double)
            doublesArray.append(number)
        }
        gradientLayer.locations = doublesArray
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

