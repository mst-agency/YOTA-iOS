//
//  InAppPresenter.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class InAppWidgetPresenter {

    // MARK: - Properties (Public)

    weak var view: InAppWidgetViewInput?
    var closeAction: (() -> Void)?
    
    // MARK: - Properties (Private)
    
    private let notificationInfo: InAppNotification
    
    // MARK: - Initializers (Public)

    init(notificationInfo: InAppNotification, view: InAppWidgetViewInput) {
        self.view = view

        self.notificationInfo = notificationInfo
    }
    
    private func action() {
        guard let notificationButton = notificationInfo.button?.routeType else { return }
        switch notificationButton {
        case .inApplication:
            print("переход внутри приложения")
        case .url:
            print("переход по внешней ссылке")
        case .otherApp:
            print("переход в другое приложение")
        }
    }
}

// MARK: - MoneyWidgetViewOutput

extension InAppWidgetPresenter: InAppWidgetViewOutput {
    func viewIsReady() {
        view?.dropContent()
        view?.displayInAppContent(text: notificationInfo.text)
        if let button = notificationInfo.button {
            view?.displayButtonTitle(title: button.title)
            view?.setButtonAction { [weak self] in
                self?.action()
            }
        }
    }
    
    func tapClose() {
        print(#function)
        self.closeAction?()
    }
}
