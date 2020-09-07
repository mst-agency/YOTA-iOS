//
//  AccountNumberFormatter.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

/// Класс для форматирования номера счета.
final class AccountNumberFormatter {

    /// Метод возвращает номера счета с 4-мя последними цифрами.
    ///
    /// - Parameter number: номер счета
    static func formattedLastDigits(accountNumber: String) -> String {
        let digitsCount = 4
        guard accountNumber.count >= digitsCount else { return "" }
        return String("* \(accountNumber.suffix(digitsCount))")
    }
}
