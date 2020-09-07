//
//  MoneyWidgetViewInput.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol MoneyWidgetViewInput: class {
    func refreshBalance(balance: NSAttributedString)
    func updateCardInfoView(accountNumber: String, paySystem: PaySystem)
}
