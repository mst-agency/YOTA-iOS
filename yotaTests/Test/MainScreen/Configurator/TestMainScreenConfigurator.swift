//
//  TestMainScreenConfigurator.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestMainScreenConfigurator: XCTestCase {
    var sut: MainScreenConfigurator!

    override func setUp() {
        sut = MainScreenConfigurator()

        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testConfigurateFunction() {
        let (view, presenter) = sut.configure()
        guard let mainPresenter = presenter as? MainScreenPresenter else { return XCTFail("Presenter is not MainScreenPresenter") }
        guard let mainView = mainPresenter.view as? MainScreenViewController else { return XCTFail("View is not MainScreenViewController") }
        XCTAssertEqual(view, mainView)
    }
}
