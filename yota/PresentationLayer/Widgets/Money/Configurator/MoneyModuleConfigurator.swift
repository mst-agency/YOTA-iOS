//
//  MoneyModuleConfigurator.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

class MoneyModuleConfigurator {

    /// Метод конфигурирует виджет "деньги" или хедер "деньги".
    /// - Parameters:
    ///   - viewInput: view виджета.
    func configureModuleForViewInput<UIView>(viewInput: UIView) {
        if let view = viewInput as? MoneyWidgetView {
            configure(view: view)
        } else if let view = viewInput as? MoneyHeaderWidgetView {
            configure(view: view)
        }
    }
    
    private func configure(view: MoneyWidgetView) {
        let getCustomerAccountDataUseCaseImp = GetCustomerAccountDataUseCaseImp()
        let presenter = MoneyPresenter(
            getCustomerAccountDataUseCase: getCustomerAccountDataUseCaseImp,
            view: view)

        presenter.view = view
        view.output = presenter
        view.output?.viewIsReady()
    }
    
    private func configure(view: MoneyHeaderWidgetView) {
        let getCustomerAccountDataUseCaseImp = GetCustomerAccountDataUseCaseImp()
        let presenter = MoneyHeaderPresenter(
            getCustomerAccountDataUseCase: getCustomerAccountDataUseCaseImp,
            view: view)

        presenter.view = view
        view.output = presenter
        view.output?.viewIsReady()
    }
}
