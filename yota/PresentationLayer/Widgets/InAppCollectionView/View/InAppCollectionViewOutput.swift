//
//  InAppCollectionViewOutput.swift
//  yota
//
//  Created by Victor on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol InAppCollectionViewOutput {
    func didTriggeredCellConfigure(index: Int) -> InAppNotification
    func didTriggeredNumberOfItemsInSection() -> Int
    func viewIsReady()
}
