//
//  WidgetSize.swift
//  yota
//
//  Created by Victor on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

struct WidgetSize {
    
    // swiftlint:disable  cyclomatic_complexity
    /// Расчитывает размер виджета для ячейки таблицы под разные устройства.
    /// - Parameter widgetReuseID: идентификатор ячейки.
    /// - Returns: размер
    static func widgetSize(widgetReuseID: String) -> CGSize {
        var size: CGSize
        switch widgetReuseID {
        case MoneyWidgetCell.reuseID:
            //У MoneyWidgetCell width не используется
            switch UIDevice.screenType {
            case .iphone5:
                size = CGSize(width: 0, height: 92)
            case .iphone6:
               size = CGSize(width: 0, height: 95)
            case .iphone6plus:
                size = CGSize(width: 0, height: 102)
            case .iphoneX:
                size = CGSize(width: 0, height: 110)
            case .ipad:
                size = CGSize(width: 0, height: 136)
            }
        case InAppCell.reuseID:
            switch UIDevice.screenType {
            case .iphone5:
                size = CGSize(width: 296, height: 125)
            case .iphone6:
                size = CGSize(width: 351, height: 125)
            case .iphone6plus:
                size = CGSize(width: 390, height: 135)
            case .iphoneX:
                size = CGSize(width: 359, height: 133)
            case .ipad:
                size = CGSize(width: 540, height: 137)
            }
        case ConnectionCell.reuseID:
            switch UIDevice.screenType {
            case .iphone5: size = CGSize(width: 0, height: 140)
            case .iphone6: size = CGSize(width: 0, height: 180)
            case .iphone6plus: size = CGSize(width: 0, height: 170)
            case .iphoneX: size = CGSize(width: 0, height: 158)
            case .ipad: size = CGSize(width: 0, height: 190)
            }
        default:
           size = CGSize(width: 0, height: 0)
        }
        
        size.height += widgetPadding(widgetReuseID: widgetReuseID).top + widgetPadding(widgetReuseID: widgetReuseID).bottom
        return size
    }
    
    // swiftlint:disable function_body_length
    /// Рассчитывает отступы виджета для ячейки таблицы под разные устройства.
    /// - Parameter widgetReuseID: идентификатор ячейки.
    /// - Returns: отступы.
    static func widgetPadding(widgetReuseID: String) -> UIEdgeInsets {
        
        switch widgetReuseID {
        case MoneyWidgetCell.reuseID:
            switch UIDevice.screenType {
            case .iphone5:
                let topBottomIsEqual: CGFloat = 0
                let leftRightIsEqual: CGFloat = 12
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphone6:
                let topBottomIsEqual: CGFloat = 0
                let leftRightIsEqual: CGFloat = 12
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphone6plus:
                let topBottomIsEqual: CGFloat = 0
                let leftRightIsEqual: CGFloat = 12
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphoneX:
                let topBottomIsEqual: CGFloat = 0
                let leftRightIsEqual: CGFloat = 8
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .ipad:
                let topBottomIsEqual: CGFloat = 0
                let leftRightIsEqual: CGFloat = 114
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            }
        case InAppCell.reuseID:
            switch UIDevice.screenType {
            case .iphone5:
                let topBottomIsEqual: CGFloat = 12
                let leftRightIsEqual: CGFloat = 8
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphone6:
                let topBottomIsEqual: CGFloat = 12
                let leftRightIsEqual: CGFloat = 6
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphone6plus:
                let topBottomIsEqual: CGFloat = 16
                let leftRightIsEqual: CGFloat = 6
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .iphoneX:
                let topBottomIsEqual: CGFloat = 20
                let leftRightIsEqual: CGFloat = 4
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            case .ipad:
                let topBottomIsEqual: CGFloat = 20
                let leftRightIsEqual: CGFloat = 34
                return UIEdgeInsets(top: topBottomIsEqual, left: leftRightIsEqual, bottom: topBottomIsEqual, right: leftRightIsEqual)
            }
        default:
            return UIEdgeInsets()
        }
    }
    
    /// Рассчитывает диапазон изменения высоты хедера с виджетом "Деньги"
    /// - Returns: диапазон в котором изменяется высота.
    static func moneyHeaderViewWidgetHeightRange() -> ClosedRange<CGFloat> {
        var range: ClosedRange<CGFloat>
        switch UIDevice.screenType {
        case .iphone5:
            range = CGFloat(58)...CGFloat(108)
        case .iphone6:
            range = CGFloat(58)...CGFloat(108)
        case .iphone6plus:
            range = CGFloat(58)...CGFloat(108)
        case .iphoneX:
            range = CGFloat(58)...CGFloat(108)
        case .ipad:
            range = CGFloat(58)...CGFloat(108)
    }
     return range
    }
}
