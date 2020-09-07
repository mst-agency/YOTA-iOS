//
//  TestConnectionCell.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestConnectionCell: XCTestCase {

    var sut: ConnectionCell!
    var mockPresenter: MockConnectionCellPresenter!

    override func setUp() {
        sut = ConnectionCell()
        mockPresenter = MockConnectionCellPresenter()

        super.setUp()
    }

    override func tearDown() {
        sut = nil
        mockPresenter = nil

        super.tearDown()
    }

    func testConfigure() {
        sut.presenter = mockPresenter

        XCTAssertTrue(mockPresenter.configureMethodIsCalled)
    }
}
