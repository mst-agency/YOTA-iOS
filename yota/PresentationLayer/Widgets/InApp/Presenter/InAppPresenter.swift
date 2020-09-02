//
//  InAppPresenter.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class InAppPresenter {

    // MARK: - Properties (Public)

    weak var view: InAppWidgetViewInput?

    // MARK: - Properties (Private)

    private let getCustomerNotificationsUseCase: GetCustomerNotificationsUseCase

    // MARK: - Initializers (Public)

    init(getCustomerNotificationsUseCase: GetCustomerNotificationsUseCase, view: InAppWidgetViewInput) {
        self.getCustomerNotificationsUseCase = getCustomerNotificationsUseCase
        self.view = view
    }
}

// MARK: - MoneyWidgetViewOutput

extension InAppPresenter: InAppWidgetViewOutput { }
