//
//  ConnectionCellPresenter.swift
//  yota
//
//  Created by Anton on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
import YotaModels

final class ConnectionCellPresenter {

    // MARK: - Property list

    weak var cell: ConnectionCellInput?
    private var profile: Profile?
    private let useCase: GetProfileUseCase
    private let updateCellSizeAction: () -> Void

    init(useCase: GetProfileUseCase, updateCellSizeAction: @escaping () -> Void) {
        self.useCase = useCase
        self.updateCellSizeAction = updateCellSizeAction
    }

}

// MARK: - ConnectionCellOutput

extension ConnectionCellPresenter: ConnectionCellOutput {

    func configure() {
        useCase.getProfile()
    }
}

// MARK: - ConnectionCellExternalInput

extension ConnectionCellPresenter: ConnectionCellExternalInput {

    func successLoading(_ profile: Profile) {
        self.profile = profile
        let presentationModel = ConnectionCellPresentationModel(from: profile)
        cell?.setUnlimitedAppsViewText(presentationModel.unlimitedAppsText,
                                       and: presentationModel.imageNamesArray)
        cell?.setConnectionAndNumberViewText(connectionLabelText: presentationModel.connectionText,
                                             numberLabelText: presentationModel.phoneNumber)
        cell?.setPriceDescriptionLabelText(presentationModel.priceDescriptionText,
                                           price: presentationModel.fullCostOfThePlannedTariff)
        updateCellSizeAction()
        
    }

    func loadingError(_ error: ServiceError) {
        cell?.showError(error)
    }
}

// MARK: CellPresenter

extension ConnectionCellPresenter: CellPresenter { }
