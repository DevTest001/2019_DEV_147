//
//  tictactoeTests.swift
//  tictactoeTests
//
//  Created by S on 25/03/2019.
//  Copyright © 2019 S. All rights reserved.
//

import XCTest
@testable import tic_tac_toe_swift

class tictactoeTests: XCTestCase {

    //MARK: - Tests Examples
    func testExample() {
        //given
        let game = TicTacToe()
        //when
        _ = game.isBoxChecked(for: 0)
        //then
        XCTAssertEqual(0, game.count)
    }
    
    //MARK: - Test Game Mechanics
    func testCheckBox() {
        //given
        let game = TicTacToe()
        //when
         game.checkBox(for: 2)
         let test = game.isBoxChecked(for: 2)
        //then
        XCTAssertEqual(true, test)
    }
    
    func testChangeTurn() {
        //given
        let game = TicTacToe()
        //when
         game.changeTurn()
        let test = game.turn
        //then
        XCTAssertEqual(false, test)
    }
    
    

}
