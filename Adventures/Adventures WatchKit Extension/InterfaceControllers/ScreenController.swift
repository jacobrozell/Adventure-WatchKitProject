//
//  ScreenController.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/5/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import WatchKit
import UIKit
import Foundation

class ScreenController: WKInterfaceController {
    @IBOutlet weak var textLabel: WKInterfaceLabel!
    @IBOutlet weak var subtextLabel: WKInterfaceLabel!

    let currentScreen = 0
    
    override func awake(withContext context: Any?) {
        textLabel.setText(GameConfig.screenFeed.screens[currentScreen].text)
        subtextLabel.setText(GameConfig.screenFeed.screens[currentScreen].subtext)
        
        
    }
    
    @IBAction func option1Pressed() {
    }
    
    @IBAction func option2Pressed() {
    }
    
    @IBAction func option3Pressed() {
    }
    
    
}
