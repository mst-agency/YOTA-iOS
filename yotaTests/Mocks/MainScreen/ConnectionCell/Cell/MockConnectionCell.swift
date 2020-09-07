//
//  MockConnectionCell.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

@testable import yota

class MockConnectionCell: ConnectionCellInput {

    var presenter: ConnectionCellOutput!
    var connectionLabelText = ""
    var numberLabelText = ""
    var unlimitedAppsViewText = ""
    var unlimitedAppsImageNamed = [String]()
    var priceDescriptionLabelText = ""
    var price = ""
    var error: ServiceError?
    
    func setConnectionAndNumberViewText(connectionLabelText: String, numberLabelText: String) {
        self.connectionLabelText = connectionLabelText
        self.numberLabelText = numberLabelText
    }
    
    func setUnlimitedAppsViewText(_ text: String, and imagesNamed: [String]) {
        self.unlimitedAppsViewText = text
        self.unlimitedAppsImageNamed = imagesNamed
    }
    
    func setPriceDescriptionLabelText(_ descriptionText: String, price: String) {
        self.priceDescriptionLabelText = descriptionText
        self.price = price
    }

    func showError(_ error: ServiceError) {
        self.error = error
    }
}
