//
//  TicTacToe.swift
//  tic-tac-toe-swift
//
//  Created by Shaher Kassam on 24/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//
// Description: 3 by 3 game
// X player is first

import UIKit

class TicTacToe {
    
    var turn: Bool = true
    
    private var x: [Bool] = Array(repeating: false, count: 9)
    private var o: [Bool] = Array(repeating: false, count: 9)
    
    private var winningCombinations: [[Int]] =
        [[0, 1, 2], [3, 4, 5], [6, 7, 8], //horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], //vertical
            [0, 4, 8], [2, 4, 6]] //diagonals
    
    // Verify if the pyer has won
    func isVictorious(for turn: Bool) -> Bool {
     
        for combination in winningCombinations {
            if isVictorious(for: play(), with: combination) {return true}
        }
       return false
    }
    
    // Set Box status
    func checkBox(for id: Int) {
        switch turn {
        case true:
            x[id] = true
            break
        case false:
            o[id] = true
        }
    }
    
    func changeTurn() { self.turn = !turn }
    
    func printVictory() -> String { return ("Winner: \(turn ? "X": "O")") }
   
    func reset() {
        x = Array(repeating: false, count: 9)
        o = Array(repeating: false, count: 9)
        turn = true
    }
    
    private func isVictorious(for grid: [Bool], with combination: [Int]) -> Bool{
        guard combination.count == 3 else {return false}
        
        return (grid[combination[0]] && grid [combination[1]] && grid[combination[2]]) ? true : false
    }
    
    //Helpers
    func play() -> [Bool] {
        switch turn {
        case true:
            return x
        case false:
            return o
        }
    }
    
    func isBoxChecked(for id: Int) -> Bool {
        return (x[id] || o[id]) ? true : false
    }
    
}
