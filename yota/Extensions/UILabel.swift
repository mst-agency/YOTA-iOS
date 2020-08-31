//
//  UILabel.swift
//  yota
//
//  Created by Anton on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

extension UILabel {

    func addGradient(colors: [UIColor]) {
        let view = UIView(frame: bounds)
        let gradient = CAGradientLayer()
        gradient.colors = colors

        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.frame = view.bounds
        
        view.layer.addSublayer(gradient)
        view.mask = self
    }
}
