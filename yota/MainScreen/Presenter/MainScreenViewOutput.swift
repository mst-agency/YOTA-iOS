//
//  MainScreenViewOutput.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol MainScreenViewOutput {
    func didTriggerGetNumberOfRows() -> Int
    func didTriggerGetWidgetCell(index: Int, tableView: UITableView) -> UITableViewCell
    func didTriggerGetWidgetSize(index: Int) -> CGFloat
    func didTriggerViewDidLoad()
}
