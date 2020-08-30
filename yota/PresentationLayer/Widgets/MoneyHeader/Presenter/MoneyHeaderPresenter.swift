//
//  MoneyHeaderPresenter.swift
//  yota
//
//  Created by Victor on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class MoneyHeaderPresenter: MoneyHeaderModuleInput, MoneyHeaderModuleOutput {

    // MARK: - Properties (Public)

    weak var view: MoneyWidgetViewInput?

    // MARK: - Properties (Private)

    private let getCustomerAccountDataUseCase: GetCustomerAccountDataUseCase
    private var cardInfo: CardInfo?

    // MARK: - Initializers (Public)

    init(getCustomerAccountDataUseCase: GetCustomerAccountDataUseCase, view: MoneyWidgetViewInput) {
        self.getCustomerAccountDataUseCase = getCustomerAccountDataUseCase
        self.view = view
        self.cardInfo = nil
    }
}

// MARK: - MoneyWidgetViewOutput

extension MoneyHeaderPresenter: MoneyWidgetViewOutput {

    func viewIsReady() {
        cardInfo = getCustomerAccountDataUseCase.getData()
        guard let cardInfo = self.cardInfo, let view = self.view else { return }
        let balance = BalanceFormatter.formattedBalance(balance: cardInfo.balance, currency: .RUB)
        let accountNumber = AccountNumberFormatter.formattedLastDigits(accountNumber: cardInfo.accountNumber)
        DispatchQueue.main.async {
            view.refreshBalance(balance: balance)
            view.updateCardInfoView(accountNumber: accountNumber, paySystem: cardInfo.paySystem)
        }
    }

    func tapBalanceTriggered() {
        print(#function)
    }

    func tapCardInfoTriggered() {
        print(#function)
    }
}
