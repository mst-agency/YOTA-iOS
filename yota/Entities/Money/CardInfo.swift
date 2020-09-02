//
//  CardInfo.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

struct CardInfo {
    /// Тип платежной системы
    let paySystem: PaySystem
    /// Номер счета
    let accountNumber: String
    /// Баланс на текущем счету
    let balance: Double
    /// Валюта счета
    let currency: Currency
}
