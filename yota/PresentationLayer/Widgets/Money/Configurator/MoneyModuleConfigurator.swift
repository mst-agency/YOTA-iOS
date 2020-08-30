//
//  MoneyModuleConfigurator.swift
//  yota
//
//  Created by Victor on 28.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

class MoneyModuleConfigurator {

    /// Метод конфигурирует виджет "деньги" который состоит из самого виджета и хедера.
    /// - Parameters:
    ///   - viewInput: view виджета.
    ///   - headerViewInput: view хедера.
    func configureModuleForViewInput<UIView>(viewInput: UIView, headerViewInput: UIView) {
        if let view = viewInput as? MoneyWidgetView, let headerView = headerViewInput as? MoneyHeaderWidgetView {
            configure(view: view, headerView: headerView)
        }
    }

    private func configure(view: MoneyWidgetView, headerView: MoneyHeaderWidgetView) {
        let getCustomerAccountDataUseCaseImp = GetCustomerAccountDataUseCaseImp()
        let presenter = MoneyPresenter(
            getCustomerAccountDataUseCase: getCustomerAccountDataUseCaseImp,
            view: view)

        presenter.view = view
        view.output = presenter
        view.output?.viewIsReady()

        let headerPresenter = MoneyHeaderPresenter(getCustomerAccountDataUseCase: getCustomerAccountDataUseCaseImp, view: headerView)
        headerPresenter.view = headerView
        headerView.output = headerPresenter
        headerView.output?.viewIsReady()
    }
}
