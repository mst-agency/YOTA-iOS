//
//  TestHeaderPresenter.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestHeaderPresenter: XCTestCase {
    
    var sut: MoneyHeaderPresenter!
    var viewMock: MoneyHeaderWidgetViewMock!
    var getCustomerAccountDataStub: GetCustomerAccountDataStub!
     var expectation = XCTestExpectation()
    
    override func setUp() {
        super.setUp()
        
        viewMock = MoneyHeaderWidgetViewMock()
        getCustomerAccountDataStub = GetCustomerAccountDataStub()
        sut = MoneyHeaderPresenter(getCustomerAccountDataUseCase: getCustomerAccountDataStub, view: viewMock)
    }
    
    override func tearDown() {
        sut = nil
        viewMock = nil
        getCustomerAccountDataStub = nil
        super.tearDown()
    }

    func test_didTriggerViewIsReady_withNotEmptyCardInfo_shouldRefreshBalance() {
        // Given
        getCustomerAccountDataStub.data = CreatorForTest.cardInfo
        // When
        sut.viewIsReady()
        // Then
        wait(for: [viewMock.expectation], timeout: 5)
        XCTAssertTrue(viewMock.refreshBalanceCalledCount == 1, "Вызван неверное количество раз refreshBalanceCalled вызван неверное количество раз")
       
        XCTAssertTrue(
            viewMock.balanceIs == BalanceFormatter.formattedBalance(
                balance: getCustomerAccountDataStub.data.balance,
                currency: getCustomerAccountDataStub.data.currency) as NSObject,
            "Не верное значение balance")
    }
    
    func test_didTriggerViewIsReady_withNotEmptyCardInfo_shouldUpdateCardInfo() {
        // Given
        getCustomerAccountDataStub.data = CreatorForTest.cardInfo
        // When
        sut.viewIsReady()
        // Then
        wait(for: [viewMock.expectation], timeout: 5)
        XCTAssertTrue(viewMock.updateCardInfoCalledCount == 1, "Вызван неверное количество раз updateCardInfoCalled ")
        XCTAssertTrue(viewMock.cardInfoView.number == AccountNumberFormatter.formattedLastDigits(accountNumber: getCustomerAccountDataStub.data.accountNumber), "Не верное значение number")
        XCTAssertTrue(viewMock.cardInfoView.paySystem == getCustomerAccountDataStub.data.paySystem, "Не верное значение paySystem")
    }
}

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

class GetCustomerAccountDataStub: GetCustomerAccountDataUseCase {

    var data: CardInfo!
    
    func getData() -> CardInfo {
        return data
    }
}

struct CreatorForTest {

    static let cardInfo = CardInfo(paySystem: .mastercard, accountNumber: "00000111000222", balance: 100, currency: .RUB)

}
