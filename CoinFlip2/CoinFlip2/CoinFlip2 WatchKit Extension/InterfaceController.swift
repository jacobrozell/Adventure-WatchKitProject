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

    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var quarterImage: WKInterfaceImage!
    
    @IBAction func flipButtonPressed() {
        quarterImage.setHidden(false)
        let images = ["head", "tail"]
        
        animate(withDuration: 0.5) {
            guard let element = images.randomElement() else { return }
            self.label.setText("\(element.capitalized)s")
            self.quarterImage.setImageNamed(element)
        }
    }

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        self.label.setText("")
        quarterImage.setHidden(true)

        super.willActivate()
    }
    
    override func didDeactivate() {
        self.label.setText("")
        quarterImage.setHidden(true)
        
        super.didDeactivate()
    }

}
