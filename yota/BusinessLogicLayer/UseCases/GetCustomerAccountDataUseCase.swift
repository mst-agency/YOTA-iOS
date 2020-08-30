//
//  GetCustomerAccountDataUseCase.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol GetCustomerAccountDataUseCase {

    // MARK: - Methods (Public)

    /// Метод для получения данных о карте
    /// - Returns: Данные карты
    func getData() -> CardInfo
}

// MARK: - GetCustomerAccountDataUseCase

final class GetCustomerAccountDataUseCaseImp: GetCustomerAccountDataUseCase {

    // MARK: - Methods (Public)

    func getData() -> CardInfo {
        CardInfo(paySystem: .mastercard, accountNumber: "1000000231232431", balance: 0.8, currency: .RUB)
    }
}
