//
//  GradientLabel.swift
//  yota
//
//  Created by Anton on 02.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class GradientLabel: UILabel {

    // MARK: - Property list

    private var colors = [CGColor]()
    private var startPoint: CGPoint = .zero
    private var endPoint: CGPoint = .zero

    // MARK: - Overrides

    override func drawText(in rect: CGRect) {
        textColor = drawGradientColor(in: rect, colors: colors)
        super.drawText(in: rect)
    }

    // MARK: - Internal methods

    func setGradient(colors: [UIColor]) {
        self.colors = colors.compactMap { $0.cgColor }
    }

    // MARK: - Private methods

    private func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }
        
        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }
        
        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: .zero,
                                    end: CGPoint(x: size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
}
