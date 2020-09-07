//
//  InAppCollectionViewPresenter.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class InAppCollectionPresenter {
    // MARK: - Properties (Public)

    weak var view: InAppCollectionViewInput?
    
    // MARK: - Properties (Private)
    private var notifications: [InAppNotification]
    private let infiniteSize: Int = 10000
    private let getCustomerNotificationsUseCase: GetCustomerNotificationsUseCase
    
    // MARK: - Initializers (Public)

    init(getCustomerNotificationsUseCase: GetCustomerNotificationsUseCase, view: InAppCollectionViewInput) {
        self.view = view
        self.getCustomerNotificationsUseCase = getCustomerNotificationsUseCase
        self.notifications = getCustomerNotificationsUseCase.getNotification()
    }
}

extension InAppCollectionPresenter: InAppCollectionViewOutput {
    func viewIsReady() {
        self.view?.showData()
    }
    
    func didTriggeredCellConfigure(index: Int) -> InAppNotification {
        return notifications[index % notifications.count]

    }
    
    func didTriggeredNumberOfItemsInSection() -> Int {
        let items = notifications.count == 1 ? notifications.count : infiniteSize
        return items
    }
}
