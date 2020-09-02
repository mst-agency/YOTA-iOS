//
//  GetCustomerNotificationsUseCase.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol GetCustomerNotificationsUseCase {

    // MARK: - Methods (Public)

    /// Метод для получения данных InAppNotification
    /// - Returns: notification
    func getNotification() -> InAppNotification
}

// MARK: - GetCustomerNotificationsUseCase

final class GetCustomerNotificationsUseCaseImp: GetCustomerNotificationsUseCase {

    // MARK: - Methods (Public)

    func getNotification() -> InAppNotification {
        InAppNotification(displayCondition: .always, text: "some text", hideCondition: .tapOnInApp)
    }
}
