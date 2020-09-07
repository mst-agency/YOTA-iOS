//
//  GetProfileUseCaseImp.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
import YotaModels

final class GetProfileUseCaseImp {

    // MARK: - Property list

    private let profileLoader: ProfileLoader
    private let codableService: CodableService
    private weak var presenter: ConnectionCellOutput?

    // MARK: - Initialization

    init(profileLoader: ProfileLoader, codableService: CodableService) {
        self.profileLoader = profileLoader
        self.codableService = codableService
    }

    private lazy var networkResponseProcessing: (Result<Data, ServiceError>) -> Void = { [weak self] result in
        guard let self = self else { return }

        switch result {
        case .success(let data): self.codableService.decode(from: data, model: Profile.self, callBack: self.decoderResponseProcessing)
        case .failure(let error):
            DispatchQueue.main.async {
                self.presenter?.loadingError(error)
            }
        }
    }

    private lazy var decoderResponseProcessing: (Result<Profile, ServiceError>) -> Void = { [weak self] result in
        switch result {
        case .success(let profile):
            DispatchQueue.main.async {
                self?.presenter?.successLoading(profile)
            }
        case .failure(let error):
            DispatchQueue.main.async {
                self?.presenter?.loadingError(error)
            }
        }
    }

}

// MARK: - GetProfileUseCase

extension GetProfileUseCaseImp: GetProfileUseCase {

    func getProfile() {
        profileLoader.loadProfile(callBack: networkResponseProcessing)
    }
}
