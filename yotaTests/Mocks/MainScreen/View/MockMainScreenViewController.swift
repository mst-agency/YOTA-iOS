//
//  MockMainScreenViewController.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class MockMainScreenViewController: MainScreenInput {

    var reloadTableIsCalled = false
    var recalculateCellSizeIsCalled = false

    var expectation = XCTestExpectation()

    func recalculateCellSize() {
        recalculateCellSizeIsCalled = true
        expectation.fulfill()
    }
}
