//
//  InAppModuleConfigurator.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

class InAppWidgetConfigurator {
    
    /// Метод конфигурирует виджет "inApp".
    /// - Parameters:
    ///   - viewInput: view виджета.
    func configureModule<UIView>(viewInput: UIView, notificationInfo: InAppNotification) {
        if let view = viewInput as? InAppWidgetView {
            configure(view: view, notificationInfo: notificationInfo)
        }
    }
    
    private func configure(view: InAppWidgetView, notificationInfo: InAppNotification) {
        
        let presenter = InAppWidgetPresenter(notificationInfo: notificationInfo, view: view)

        presenter.view = view
        view.output = presenter
        view.output?.viewIsReady()
    }
}
