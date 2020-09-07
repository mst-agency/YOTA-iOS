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
        getCustomerAccountDataStub.data = Creator.cardInfo
        // When
        sut.viewIsReady()
        // Then
        wait(for: [viewMock.expectation], timeout: 5)
        XCTAssertTrue(viewMock.refreshBalanceCalledCount == 1, "Вызван неверное количество раз refreshBalanceCalled")
       
        XCTAssertTrue(
            viewMock.balanceIs == BalanceFormatter.formattedBalance(
                balance: getCustomerAccountDataStub.data.balance,
                currency: getCustomerAccountDataStub.data.currency) as NSObject,
            "Не верное значение balance")
    }
    
    func test_didTriggerViewIsReady_withNotEmptyCardInfo_shouldUpdateCardInfo() {
        // Given
        getCustomerAccountDataStub.data = Creator.cardInfo
        // When
        sut.viewIsReady()
        // Then
        wait(for: [viewMock.expectation], timeout: 5)
        XCTAssertTrue(viewMock.updateCardInfoCalledCount == 1, "Вызван неверное количество раз updateCardInfoCalled ")
        XCTAssertTrue(viewMock.cardInfoView.number == AccountNumberFormatter.formattedLastDigits(accountNumber: getCustomerAccountDataStub.data.accountNumber), "Не верное значение number")
        XCTAssertTrue(viewMock.cardInfoView.paySystem == getCustomerAccountDataStub.data.paySystem, "Не верное значение paySystem")
    }
}
