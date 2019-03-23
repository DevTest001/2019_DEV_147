//
//  gameButton.swift
//  tic-tac-toe-swift
//
//  Created by Shaher Kassam on 23/03/2019.
//  Copyright © 2019 Shaher. All rights reserved.
//

import UIKit

class GameButton: UIButton {
    
    var gameState: states
    
    enum states {
        case X, O, blank
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.gameState = .blank
        super.init(coder: aDecoder)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    
}
