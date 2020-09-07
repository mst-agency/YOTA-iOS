//
//  InAppCollectionConfigurator.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

class InAppCollectionConfigurator {
    
    /// Метод конфигурирует "InAppCollectionView".
    func configureModule<UICollectionView>(viewInput: UICollectionView) {
        if let view = viewInput as? InAppCollectionView {
            configure(view: view)
        }
    }
    
    private func configure(view: InAppCollectionView) {
        let getCustomerNotification = GetCustomerNotificationsUseCaseImp()
        let presenter = InAppCollectionPresenter(getCustomerNotificationsUseCase: getCustomerNotification, view: view)
        presenter.view = view
        view.output = presenter
        view.output?.viewIsReady()
    }
}
