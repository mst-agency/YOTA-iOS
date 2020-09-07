//
//  TestUIFont.swift
//  yotaTests
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import XCTest
@testable import yota

class TestUIFont: XCTestCase {
    
    let size: CGFloat = 18

    func testCircleBold() {
        XCTAssertNotEqual(UIFont.circeBold(size: size), UIFont.systemFont(ofSize: size))
    }

    func testCircleRegular() {
        XCTAssertNotEqual(UIFont.circeRegular(size: size), UIFont.systemFont(ofSize: size))
    }

    func testCircleExtraBold() {
        XCTAssertNotEqual(UIFont.circeExtraBold(size: size), UIFont.systemFont(ofSize: size))
    }
}
