//
//  tictactoeUITests.swift
//  tictactoeUITests
//
//  Created by S on 25/03/2019.
//  Copyright © 2019 S. All rights reserved.
//

import XCTest

class tictactoeUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    
    //MARK: -  UI Test
    func testDisablingButtonOnVictory() {
        //given
        app.launch()
        //when
        app.buttons["0"].tap() //X
        app.buttons["1"].tap() //O
        app.buttons["3"].tap() //X
        app.buttons["4"].tap() //O
        app.buttons["6"].tap() //X
        //then
        XCTAssertEqual(false, app.buttons["8"].isEnabled)
    }
    
    func testBeginning() {
        //given
        //when
        app.launch()
        //then
        XCTAssertEqual(true, app.buttons["0"].isEnabled)
    }
    
}
