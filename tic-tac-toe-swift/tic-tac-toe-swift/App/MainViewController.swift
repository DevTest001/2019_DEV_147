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
    private var turn: Bool = true
    private let XImage = UIImage(named: "X")
    private let OImage = UIImage(named: "O")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Action
    @IBAction func buttonTouched(_ sender: UIButton) {
        buttonState(button: sender as! GameButton)
    }
    
    //Function
    func buttonState(button: GameButton) {
        
        if button.gameState == .blank {
            if turn {
                button.setBackgroundImage(XImage, for: .normal)
                button.gameState = .X
            } else {
                button.setBackgroundImage(OImage, for: .normal)
                button.gameState = .O
            }
            //Next turn
            turn = !turn
        }
    }
}


