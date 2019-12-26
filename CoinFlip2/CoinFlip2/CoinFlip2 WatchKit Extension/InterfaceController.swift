//
//  InterfaceController.swift
//  Coin Flip WatchKit Extension
//
//  Created by Jacob Rozell on 12/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import WatchKit
import UIKit
import Foundation

enum CoinFace: String {
    case heads = "Heads"
    case tails = "Tails"
}

enum Direction: String {
    case tailsToHeads = "th"
    case headsToHeads = "hh"
    case headsToTails = "ht"
    case tailsToTails = "tt"
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var flipButton: WKInterfaceButton!
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var quarterImage: WKInterfaceImage!
    
    var currentSide: CoinFace = .heads
    var nextSide: CoinFace = .tails
    
    var direction: Direction = .headsToTails
    var length: Int = 6
    var duration = 1.0
    
    @IBAction func flipButtonPressed() {
        flip()
    }
    
    func flip() {
        let int = Int.random(in: 1...2)
        nextSide = (int == 1) ? .heads : .tails
        
        if currentSide == .heads {
            direction = nextSide == .tails ? .headsToTails : .headsToHeads
        } else if currentSide == .tails {
            direction = nextSide == .heads ? .tailsToHeads : .tailsToTails
        }
        
        setupAnimations()
        animateImages()
    }
    
    /// Calculates duration and how many frames will be in the animation
    func setupAnimations() {
        switch direction {
        case .tailsToHeads:
            length = 6
            duration = 0.5
            break
        case .headsToHeads:
            length = 11
            duration = 1.0
            break
        case .headsToTails:
            length = 6
            duration = 0.5
            break
        case .tailsToTails:
            length = 11
            duration = 1.0
            break
        }
        
        // Setup which animation will show
        quarterImage.setImageNamed(direction.rawValue)
    }

    func animateImages() {
        quarterImage.startAnimatingWithImages(in: NSRange(location: 0, length: length), duration: duration, repeatCount: 1)
        
        currentSide = nextSide
        self.label.setText("\(currentSide.rawValue)")
    }
}
