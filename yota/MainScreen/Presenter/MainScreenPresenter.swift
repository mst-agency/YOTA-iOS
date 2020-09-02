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
    func didTriggerGetNumberOfRows() -> Int {
        widgets.count
    }
    
    func didTriggerGetWidgetCell(index: Int, tableView: UITableView) -> UITableViewCell {
        switch widgets[index] {
        case MoneyWidgetCell.reuseID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoneyWidgetCell.reuseID) as? MoneyWidgetCell else { fatalError("Wrong cell") }
            return cell
        case InAppCell.reuseID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InAppCell.reuseID) as? InAppCell else { fatalError("Wrong cell") }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func didTriggerGetWidgetSize(index: Int) -> CGFloat {
        WidgetSize.widgetSize(widgetReuseID: widgets[index]).height
    }
    
    func didTriggerViewDidLoad() {
        return
    }
}
