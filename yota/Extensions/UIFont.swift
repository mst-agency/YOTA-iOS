//
//  UIFont.swift
//  yota
//
//  Created by Victor on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

extension UIFont {
    static func circeBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Circe-Bold", size: size) ?? .systemFont(ofSize: size)
    }

    static func circeRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Circe-Regular", size: size) ?? .systemFont(ofSize: size)
    }

    static func circeExtraBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Circe-ExtraBold", size: size) ?? .systemFont(ofSize: size)
    }
}
