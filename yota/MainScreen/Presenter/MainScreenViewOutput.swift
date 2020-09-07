//
//  MainScreenViewOutput.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
import CoreGraphics

protocol MainScreenViewOutput {
    func getNumberOfRows() -> Int
    func getCellPresenter() -> CellPresenter
    func didTriggerGetWidgetCellReuseID(index: Int) -> String
    func didTriggerGetWidgetSize(index: Int) -> CGFloat
}
