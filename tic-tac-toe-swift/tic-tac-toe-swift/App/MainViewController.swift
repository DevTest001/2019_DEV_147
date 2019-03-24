//
//  MainViewController.swift
//  tic-tac-toe-swift
//
//  Created by Shaher Kassam on 23/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Outlets
    @IBOutlet var winnerLabel: UILabel!
    
    //Var
    private var turn: Bool = true //Player X: true
    private let XImage = UIImage(named: "X")
    private let OImage = UIImage(named: "O")
    private var gridX: [Bool] = Array(repeating: false, count: 9)
    private var gridO: [Bool] = Array(repeating: false, count: 9)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Action
    @IBAction func buttonTouched(_ sender: UIButton) {
        buttonState(button: sender)
    }
    
    //Function
    func buttonState(button: UIButton) {
        
        if !gridX[button.tag], !gridO[button.tag] {  //Verify if the button was never played
            if turn {   //Player X
                button.setBackgroundImage(XImage, for: .normal)
                gridX[button.tag] = true
                victoryCheck(grid: gridX)
            } else { //Player O
                button.setBackgroundImage(OImage, for: .normal)
                gridO[button.tag] = true
                victoryCheck(grid: gridO)
            }

            turn = !turn   //Next turn
        }
    }
    
    
    func  victoryCheck(grid: [Bool]) {
        
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], //horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], //vertical
            [0, 4, 8], [2, 4, 6]] //diagonals
        
        
        for combination in winningCombinations {
            gridCheckCombination(for: grid, with: combination)
        }
    }
    
    
    func gridCheckCombination(for grid: [Bool], with combination: [Int] ) {
        guard combination.count == 3 else {return}
        
        if grid[combination[0]], grid [combination[1]], grid[combination[2]] {print("Win:", turn)}
    }
    
    
}


