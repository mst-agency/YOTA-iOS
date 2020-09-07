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
    func getNotification() -> [InAppNotification]
}

// MARK: - GetCustomerNotificationsUseCase

final class GetCustomerNotificationsUseCaseImp: GetCustomerNotificationsUseCase {

    // MARK: - Methods (Public)
    
    func getNotification() -> [InAppNotification] {
        // swiftlint:disable line_length
        return [
            InAppNotification(displayCondition: .always, text: "Для вас особое предложение, на уникальных условиях!", hideCondition: .tapOnInApp, button: InAppNotificationButton(title: "Перейти", routeType: .url)),
            InAppNotification(displayCondition: .always, text: "Поздравляем! Для вас бонус. Пакет 100 минут бесплатно на любые операторы!", hideCondition: .tapOnInApp, button: nil),
            InAppNotification(displayCondition: .always, text: "Недостаточно средств для продления пакета. Доступ в интернет заблокирован. Пополните счет на 120 ₽", hideCondition: .tapOnInApp, button: InAppNotificationButton(title: "Оплатить 120 ₽", routeType: .otherApp))
        ]
    }
}
