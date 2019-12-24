//
//  InterfaceController.swift
//  How many fingers WatchKit Extension
//
//  Created by Jacob Rozell on 12/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var currentGuess: Int = 0

    @IBOutlet var guessSlider: WKInterfaceSlider!
    @IBOutlet var guessLabel: WKInterfaceLabel!
    @IBOutlet var rightWrongLabel: WKInterfaceLabel!
    
    @IBAction func guessPressed() {
        let randomNumber = Int.random(in: 1...5)
        if randomNumber == currentGuess {
            rightWrongLabel.setText("Correct!")
        } else {
            rightWrongLabel.setText("Wrong! It was \(randomNumber)")
        }
    }
    
    @IBAction func guessUpdated(_ value: Float) {
        currentGuess = Int(value * 5)
        guessLabel.setText("Your guess: \(currentGuess)")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

}
