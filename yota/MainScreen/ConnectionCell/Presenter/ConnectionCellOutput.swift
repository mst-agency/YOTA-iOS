//
//  ConnectionCellOutput.swift
//  yota
//
//  Created by Anton on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import YotaModels

protocol ConnectionCellOutput: AnyObject {
    func configure()
    func successLoading(_ profile: Profile)
    func loadingError(_ error: ServiceError)
}
