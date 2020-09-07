//
//  TestMainScreenPresenter.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestMainScreenPresenter: XCTestCase {

    var sut: MainScreenPresenter!
    var mockViewController: MockMainScreenViewController!

    override func setUp() {
        sut = MainScreenPresenter()
        mockViewController = MockMainScreenViewController()
        sut.view = mockViewController

        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockViewController = nil
    }

    func testReloadTableIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockViewController.reloadTableIsCalled)
    }
}
