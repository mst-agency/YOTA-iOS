//
//  TestConnectionCellPresenter.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestConnectionCellPresenter: XCTestCase {

    var sut: ConnectionCellPresenter!
    var mockCell: MockConnectionCell!
    var mockUseCase: MockGetProfileUseCase!

    var updateCellSizeActionIsCalled = false
    var expectation = XCTestExpectation()

    override func setUp() {
        mockCell = MockConnectionCell()
        mockUseCase = MockGetProfileUseCase()

        sut = ConnectionCellPresenter(useCase: mockUseCase,
                                      updateCellSizeAction: updateCellSizeAction)
        mockUseCase.cellPresenter = sut
        sut.cell = mockCell

        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockCell = nil
        mockUseCase = nil
    }

    lazy var updateCellSizeAction: () -> Void = { [weak self] in
        self?.updateCellSizeActionIsCalled = true
        self?.expectation.fulfill()
    }

    func testCellPresenterConfigure() {
        sut.configure()

        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(updateCellSizeActionIsCalled)
        XCTAssertFalse(mockCell.connectionLabelText.isEmpty)
        XCTAssertFalse(mockCell.numberLabelText.isEmpty)
        XCTAssertFalse(mockCell.unlimitedAppsViewText.isEmpty)
        XCTAssertFalse(mockCell.unlimitedAppsImageNamed.isEmpty)
        XCTAssertFalse(mockCell.priceDescriptionLabelText.isEmpty)
        XCTAssertFalse(mockCell.price.isEmpty)
    }

    func testCellPresenterLoadingError() {
        sut.loadingError(.noData)
        XCTAssertNotNil(mockCell.error)
    }
}
