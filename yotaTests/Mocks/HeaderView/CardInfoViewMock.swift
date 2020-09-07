//
//  CardInfoViewMock.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
@testable import yota

class CardInfoViewMock: CardInfoViewable {
    
    var paySystem: PaySystem!
    var number = ""
    
    func upadtePaySystem(paySystem: PaySystem) {
        self.paySystem = paySystem
    }
    
    func updateAccountNumber(number: String) {
        self.number = number
    }
    
}
