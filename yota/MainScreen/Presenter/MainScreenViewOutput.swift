//
//  MainScreenViewOutput.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol MainScreenViewOutput {
    func viewDidLoad()
    func getNumberOfRows() -> Int
    func didTriggerGetWidgetCellReuseID(index: Int) -> String
    func didTriggerGetWidgetSize(index: Int) -> CGFloat
}
