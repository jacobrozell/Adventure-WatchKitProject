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

class InterfaceController: WKInterfaceController {

    @IBOutlet var flipButton: WKInterfaceButton!
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var quarterImage: WKInterfaceImage!
    
    @IBAction func flipButtonPressed() {
        flip()
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
    
    func flip() {
        let images = ["head", "tail"]
        
        animate(withDuration: 1.0) {
            guard let element = images.randomElement() else { return }
            self.flipButton.setHidden(false)
            self.quarterImage.setHidden(false)
            
            self.label.setText("\(element.capitalized)s")
            self.quarterImage.setImageNamed(element)
        }
    }

}
