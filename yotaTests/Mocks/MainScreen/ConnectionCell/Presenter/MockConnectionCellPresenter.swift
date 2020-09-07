//
//  MockConnectionCellPresenter.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class MockConnectionCellPresenter: ConnectionCellOutput {

    var configureMethodIsCalled = false

    func configure() {
        configureMethodIsCalled = true
    }
}
