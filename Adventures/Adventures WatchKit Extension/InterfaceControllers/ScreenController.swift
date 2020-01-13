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
    
    private var currentScreenIndex = 0
    private var currentScreen: Screen = Screen()
    private var faction: Faction = .good
    private var options: [Option] = []
    private var adventureComplete = false
    
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
        
        setupButtons()
    }
    
    // MARK: - Functions
    private func setupButtons() {
        for (index, option) in options.enumerated() {
            switch index {
            case 0:
                set(button: button1, with: option.choice)
                GameConfig.button1Link = option.screenLink
                GameConfig.rewards1 = option.rewards
            case 1:
                set(button: button2, with: option.choice)
                GameConfig.button2Link = option.screenLink
                GameConfig.rewards2 = option.rewards
            case 2:
                set(button: button3, with: option.choice)
                GameConfig.button3Link = option.screenLink
                GameConfig.rewards3 = option.rewards
            default:
                print("wtf??????????\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\n\n\n\n\n\n\n\n\n")
            }
        }
    }
    
    private func set(button: WKInterfaceButton, with title: String) {
        button.setHidden(false)
        button.setTitle(title)
    }
    
    private func isLinkValid(_ link: Int) -> Bool {
        if link == -1 {
            leaveAdventure(vc: self)
            return false
        } else if link >= GameConfig.screenFeed.screens.count {
            return false
        } else if link == 103 {
            adventureComplete = true
            return true
        }
        
        return true
    }
    
    // MARK: - IBActions
    @IBAction func option1Pressed() {
        if isLinkValid(GameConfig.button1Link) {
            if adventureComplete {
                GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards1)
                // Go to rewards screen!!!!!!!!!
                // remember to pop this controller and make home screen the root controller
            } else {
                currentScreenIndex = GameConfig.button1Link
                GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards1)
            }
        }
        self.awake(withContext: nil)
    }
    
    @IBAction func option2Pressed() {
        if isLinkValid(GameConfig.button2Link) {
            currentScreenIndex = GameConfig.button2Link
            GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards2)
        }
        self.awake(withContext: nil)
    }
    
    @IBAction func option3Pressed() {
        if isLinkValid(GameConfig.button3Link) {
            currentScreenIndex = GameConfig.button3Link
            GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards3)
        }
        self.awake(withContext: nil)
    }
}
