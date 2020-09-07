//
//  MainScreenConfigurator.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MainScreenConfigurator {

    func configure() -> MainScreenViewController {
        let presenter = MainScreenPresenter()
        let view = MainScreenViewController(output: presenter)
        presenter.view = view

        return view
    }
}
