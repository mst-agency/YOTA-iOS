//
//  ConnectionCellExternalInput.swift
//  yota
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import YotaModels

protocol ConnectionCellExternalInput: AnyObject {
    func successLoading(_ profile: Profile)
    func loadingError(_ error: ServiceError)
}
