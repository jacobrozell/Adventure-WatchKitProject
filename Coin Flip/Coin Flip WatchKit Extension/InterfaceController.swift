//
//  InterfaceController.swift
//  Coin Flip WatchKit Extension
//
//  Created by Jacob Rozell on 12/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var quarterImage: WKInterfaceImage!
    
    @IBAction func flipButtonPressed() {
        let images = [UIImage(named: "head"), UIImage(named: "tail")]
        
        quarterImage.setImage(images[Int.random(in: 0...1)])
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
