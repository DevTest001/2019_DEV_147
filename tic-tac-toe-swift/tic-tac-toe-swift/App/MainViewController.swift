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
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    
    //Var
    private let XImage = UIImage(named: "X")
    private let OImage = UIImage(named: "O")
    
    var game = TicTacToe()
    
    //Override
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    
    //Action
    @IBAction func buttonTouched(_ sender: UIButton) {
        playerPushed(box: sender)
    }
    
    @IBAction func reset(_ sender: Any) {
        game.reset()
        resetView()
    }
    
    //Functions
    func playerPushed(box: UIButton) {
        
        if !game.isBoxPlayed(for: box.tag) {
            setImage(for: box)
            game.checkBox(for: box.tag)
            nextMove()
        }
    }
    
    func nextMove() {
        if game.isVictorious(for: game.turn) {
            game.printVictory()
            self.printVictory()
            self.stopGame()
            self.showResetButton()
        } else {
            game.changeTurn()
        }
    }
   
    func stopGame() {
        for button in buttons {
            button.isEnabled = false }
    }
    
    func showResetButton() {
        resetButton.isHidden = false
    }
    
    func printVictory() {
        winnerLabel.text = "Winner: \(game.turn ? "X":"O")"
    }
    
    func setImage(for button: UIButton) {
        if game.turn { //Player X
            button.setBackgroundImage(XImage, for: .normal)
        } else { //Player O
            button.setBackgroundImage(OImage, for: .normal)
        }
    }
    
    func resetView() {
        //title
        winnerLabel.text = "Winner: ?"
        //buttons
        for button in buttons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
    }
}


