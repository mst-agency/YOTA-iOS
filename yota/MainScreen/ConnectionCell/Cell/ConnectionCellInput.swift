//
//  ConnectionCellInput.swift
//  yota
//
//  Created by Anton on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol ConnectionCellInput: AnyObject {
    func setConnectionAndNumberViewText(connectionLabelText: String, numberLabelText: String)
    func setUnlimitedAppsViewText(_ text: String, and imagesNamed: [String])
    func setPriceDescriptionLabelText(_ descriptionText: String, price: String)
    func showError(_ error: ServiceError)
}
