//
//  BalanceFormatter.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

/// Класс для форматирования баланса счета.
final class BalanceFormatter {
    
    /// Метод форматирует баланс.
    /// - Parameters:
    ///   - balance: сумма.
    ///   - currency: валюта.
    /// - Returns: отформатированный баланс для вывода.
    static func formattedBalance(balance: Double, currency: Currency) -> NSAttributedString {
        switch currency {
        case .RUB:
            return ruFormattedBalance(balance)
        }
    }
    
    /// Метод форматирует баланс в рублях.
    /// - Parameter balance: баланс.
    /// - Returns: строка с атрибутом цвета.
    private static func ruFormattedBalance(_ balance: Double) -> NSAttributedString {
        var result = ""
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = " "
        guard let formatBalance = formatter.string(from: NSNumber(value: balance)) else { return NSAttributedString(string: "-") }
        result += formatBalance
        result += " ₽"
        
        var attributes = [NSAttributedString.Key: AnyObject]()
        attributes[.foregroundColor] = balance >= 0 ? UIColor.Money.title : UIColor.red
        
        return NSAttributedString(string: result, attributes: attributes)
    }
}
