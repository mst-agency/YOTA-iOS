//
//  MainScreenPresenter.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

final class MainScreenPresenter {

    // MARK: - Property list

    var view: MainScreenInput?
//    private var cellModels

}

// MARK: MainScreenModuleOutput

extension MainScreenPresenter: MainScreenModuleOutput { }

// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenViewOutput {

    func viewDidLoad() {
        return
    }

    func getNumberOfRows() -> Int {
        return 0
    }
}
