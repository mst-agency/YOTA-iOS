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
    private var widgets: [String] = [MoneyWidgetCell.reuseID, InAppCell.reuseID]
    private var cellPresenters = [CellPresenter]()

    // MARK: - Private methods

    private func configureConnectionCellPresenter() {
        let mockUseCase = MockGetProfileUseCase()
        let connectionCellPresenter = ConnectionCellPresenter(useCase: mockUseCase, updateCellSizeAction: updateCellSizeAction)
        mockUseCase.cellPresenter = connectionCellPresenter
        cellPresenters.append(connectionCellPresenter)
    }

    private lazy var updateCellSizeAction: () -> Void = { [weak self] in
        self?.view?.recalculateCellSize()
    }

}

// MARK: MainScreenModuleOutput

extension MainScreenPresenter: MainScreenModuleOutput { }

// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    func viewDidLoad() {
        configureConnectionCellPresenter()
        view?.reloadTable()
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
