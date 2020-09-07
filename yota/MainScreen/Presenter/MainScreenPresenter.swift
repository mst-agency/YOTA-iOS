//
//  MainScreenPresenter.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MainScreenPresenter {

    // MARK: - Property list

    var view: MainScreenInput?
    private var widgets: [String] = [MoneyWidgetCell.reuseID, InAppCell.reuseID]
}

// MARK: MainScreenModuleOutput

extension MainScreenPresenter: MainScreenModuleOutput { }

// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    func viewDidLoad() {
        return
    }
    
    func getNumberOfRows() -> Int {
         widgets.count
    }
    
    func didTriggerGetWidgetCellReuseID(index: Int) -> String {
        widgets[index]
    }
    
    func didTriggerGetWidgetSize(index: Int) -> CGFloat {
        WidgetSize.widgetSize(widgetReuseID: widgets[index]).height
    }
}
