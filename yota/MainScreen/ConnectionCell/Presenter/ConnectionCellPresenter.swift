//
//  ConnectionCellPresenter.swift
//  yota
//
//  Created by Anton on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class ConnectionCellPresenter {

    // MARK: - Property list

    weak var cell: ConnectionCellInput?
}

// MARK: - ConnectionCellOutput

extension ConnectionCellPresenter: ConnectionCellOutput {
    func configure() {
        cell?.setInlimitedAppsViewText("Безлимитные мобильные приложения", and: ["fb.png", "insta.png", "ok.png"])
        cell?.setPriceDescriptionLabelText("Стоимость за 30 дней", price: "360 ₽")
        cell?.setConnectionAndNumberViewText(connectionLabelText: "СВЯЗЬ", numberLabelText: "+7 999 532-23-89")
    }
}

extension ConnectionCellPresenter: CellPresenter { }
