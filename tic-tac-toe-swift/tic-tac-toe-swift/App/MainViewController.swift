//
//  MainViewController.swift
//  tic-tac-toe-swift
//
//  Created by Shaher Kassam on 23/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//
// Description: 3 by 3 View

import UIKit

class MainViewController: UIViewController {
    
    //Outlets
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    //Vars
    private let XImage = UIImage(named: "X")
    private let OImage = UIImage(named: "O")
    private var game = TicTacToe()
    
    //Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.exclusiveButtons()
    }
    
    //Actions
    @IBAction func buttonTouched(_ sender: UIButton) {
        self.playerCheck(box: sender)
    }
    
    @IBAction func reset(_ sender: Any) {
        game.reset()
        self.resetView()
    }
    
    //Functions
    func playerCheck(box: UIButton) {
        
        if !game.isBoxChecked(for: box.tag) {
            self.setImage(for: box)
            game.checkBox(for: box.tag)
            self.nextMove()
        }
    }
    
    func nextMove() {
        if game.isVictorious(for: game.turn) {
            self.stopGame()
            self.printVictory()
            self.showResetButton()
        } else if game.count == 8 {
            self.printDraw()
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
        winnerLabel.text = game.printVictory()
        //anime
        self.rotateTitleUpSideDown()
        self.rotateBackTitle()
        
    }
    
    func printDraw() {
        winnerLabel.text = "Draw !"
    }
    
    func exclusiveButtons() {
        //Exclusive
        for button in buttons {
            button.isExclusiveTouch = true
        }
    }
    
    func setImage(for button: UIButton) {
        if game.turn { //Player X
            button.setBackgroundImage(XImage, for: .normal)
        } else { //Player O
            button.setBackgroundImage(OImage, for: .normal)
        }
    }
    
    func rotateTitleUpSideDown() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.winnerLabel.transform = CGAffineTransform(rotationAngle: (.pi))
        }, completion: { finished in
            print("Rotate title")
        })
    }
    
    func rotateBackTitle() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.winnerLabel.transform = CGAffineTransform(rotationAngle: (2 * .pi))
        }, completion: { finished in
            print("Rotate title back")
        })
    }
    
    func resetView() {
        //title
        winnerLabel.text = "Winner: ?"
        
        
        //game buttons
        for button in buttons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
        resetButton.isHidden = true
    }
}


