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

enum Faction {
    case good
    case bad
}

class ScreenController: WKInterfaceController {
    @IBOutlet weak var textLabel: WKInterfaceLabel!
    @IBOutlet weak var subtextLabel: WKInterfaceLabel!
    
    @IBOutlet weak var button1: WKInterfaceButton!
    @IBOutlet weak var button2: WKInterfaceButton!
    @IBOutlet weak var button3: WKInterfaceButton!
    
    var currentScreenIndex = 0
    var currentScreen: Screen = Screen()
    var faction: Faction = .good
    var options: [Option] = []
    
    override func awake(withContext context: Any?) {
        
        scroll(to: textLabel, at: WKInterfaceScrollPosition(rawValue: 0)!, animated: false)
        
        button1.setHidden(true)
        button2.setHidden(true)
        button3.setHidden(true)
        
        faction = GameConfig.playerClass == .mage ? .good : .bad
        currentScreen = GameConfig.screenFeed.screens[currentScreenIndex]
        options = faction == .good ? GameConfig.screenFeed.screens[currentScreenIndex].options.good : GameConfig.screenFeed.screens[currentScreenIndex].options.bad
        
        textLabel.setText(currentScreen.text)
        subtextLabel.setText(currentScreen.subtext)
        
        for (index, option) in options.enumerated() {
            switch index {
            case 0:
                set(button: button1, with: option.choice)
                GameConfig.button1Link = option.screenLink
            case 1:
                set(button: button2, with: option.choice)
                GameConfig.button2Link = option.screenLink
            case 2:
                set(button: button3, with: option.choice)
                GameConfig.button3Link = option.screenLink
            default:
                print("wtf??????????\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\n\n\n\n\n\n\n\n\n")
            }
        }
        
    }
    
    func set(button: WKInterfaceButton, with title: String) {
        button.setHidden(false)
        button.setTitle(title)
    }
    
    @IBAction func option1Pressed() {
        currentScreenIndex = GameConfig.button1Link
        self.awake(withContext: nil)
    }
    
    @IBAction func option2Pressed() {
        currentScreenIndex = GameConfig.button2Link
        self.awake(withContext: nil)
    }
    
    @IBAction func option3Pressed() {
        currentScreenIndex = GameConfig.button3Link
        self.awake(withContext: nil)
    }
    
    
}
