//
//  MainViewController.swift
//  tic-tac-toe-swift
//
//  Created by Shaher Kassam on 23/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//
// Description: 3 by 3 View

import UIKit
 import AVFoundation

class MainViewController: UIViewController {
    
    //MARK: - Vars
    //Outlets
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    //privatess
    private let XImage = UIImage(named: "X")
    private let OImage = UIImage(named: "O")
    var player: AVAudioPlayer?

    private var game = TicTacToe()
    
    //Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.exclusiveButtons()
    }
    
    //MARK: - Actions
    @IBAction func buttonTouched(_ sender: UIButton) {
        self.hapticWhenPress()
        self.playerCheck(box: sender)
    }
    
    @IBAction func reset(_ sender: Any) {
        game.reset()
        self.resetView()
    }
    
    //MARK: - Functions
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
        self.playSound()
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
    
    func hapticWhenPress() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func rotateTitleUpSideDown() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.winnerLabel.transform = CGAffineTransform(rotationAngle: (.pi))
        }, completion: { finished in
            //log if needed
        })
    }
    
    func rotateBackTitle() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.winnerLabel.transform = CGAffineTransform(rotationAngle: (2 * .pi))
        }, completion: { finished in
            //log if needed
        })
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "OMG", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
            
        } catch {
            //print(error.localizedDescription)
            //TODO: error management goes here
        }
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


