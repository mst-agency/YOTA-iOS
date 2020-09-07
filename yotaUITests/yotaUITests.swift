//
//  yotaUITests.swift
//  yotaUITests
//
//  Created by Dexter on 24.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest

class YotaUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testApp() {
        app.launch()
        let tableView = app.tables.element

        XCTAssertTrue(tableView.exists)
        let moneyTitleLabel = app.staticTexts[AccessibilityIdentifiers.MoneyModule.mainTitleLabel]
        XCTAssertTrue(moneyTitleLabel.exists)
        XCTAssertEqual(moneyTitleLabel.label, "ДЕНЬГИ")

        let balanceTitleLabel  = app.staticTexts[AccessibilityIdentifiers.MoneyModule.widgetBalanceTitleLabel]
        XCTAssertTrue(balanceTitleLabel.exists)
        XCTAssertEqual(balanceTitleLabel.label, "Баланс")

        let сellWithCollectionView = tableView.cells[AccessibilityIdentifiers.InApp.cell]
        XCTAssertTrue(сellWithCollectionView.exists)
        for _ in 0...20 {
            сellWithCollectionView.swipeLeft()
        }
        tableView.swipeUp()

        let priceDescriptionLabel = app.staticTexts[AccessibilityIdentifiers.ConnectionModule.priceDescriptionLabel]
        XCTAssertTrue(priceDescriptionLabel.exists)
        XCTAssertEqual(priceDescriptionLabel.label, "Общая сумма на 30 дней")

        let connectionLabel = app.staticTexts[AccessibilityIdentifiers.ConnectionModule.connectionLabel]
        XCTAssertTrue(connectionLabel.exists)
        XCTAssertEqual(connectionLabel.label, "СВЯЗЬ")
    
        let unlimitedAppsLabel = app.staticTexts[AccessibilityIdentifiers.ConnectionModule.unlimitedAppsLabel]
        XCTAssertTrue(unlimitedAppsLabel.exists)
        XCTAssertEqual(unlimitedAppsLabel.label, "Безлимитные мобильные приложения")
    }
}
