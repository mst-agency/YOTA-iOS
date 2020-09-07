//
//  MoneyHeaderWidgetViewMock.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class MoneyHeaderWidgetViewMock: MoneyHeaderViewInput {
    
    var didScrollCalledCount: UInt = 0
    var refreshBalanceCalledCount: UInt = 0
    var updateCardInfoCalledCount: UInt = 0
    var balanceIs = NSAttributedString(string: "")
    var cardInfoView = CardInfoViewMock()
    
    var expectation = XCTestExpectation(description: #function)
    
    func didScroll(scrollView: UIScrollView) {
        didScrollCalledCount += 1
    }
    
    func refreshBalance(balance: NSAttributedString) {
        refreshBalanceCalledCount += 1
        balanceIs = balance
        expectation.fulfill()
    }
    
    func updateCardInfoView(accountNumber: String, paySystem: PaySystem) {
        updateCardInfoCalledCount += 1
        cardInfoView.upadtePaySystem(paySystem: paySystem)
        cardInfoView.updateAccountNumber(number: accountNumber)
        expectation.fulfill()
    }
}
