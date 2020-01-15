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

class AdventureController: WKInterfaceController {
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
                print("problem in setupButtons->AdventureController")
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
        } else if link == -103 {
            adventureComplete = true
            return true
        }
        
        return true
    }
    
    private func giveRewards(with button: Int) {
        switch button {
        case 1:
            GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards1)
        case 2:
            GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards2)
        case 3:
            GameConfig.__playerRewardsForAdventure.append(GameConfig.rewards3)
        default:
            print("problem with rewards")
        }
    }
    
    // MARK: - IBActions
    @IBAction func option1Pressed() {
        if isLinkValid(GameConfig.button1Link) {
            if adventureComplete {
                giveRewards(with: 1)
                navigate(to: Navigation.rewardID, from: self, shouldChangeRoot: true)
            } else {
                currentScreenIndex = GameConfig.button1Link
                giveRewards(with: 1)
            }
        }
        self.awake(withContext: nil)
    }
    
    @IBAction func option2Pressed() {
        if isLinkValid(GameConfig.button2Link) {
            if adventureComplete {
                giveRewards(with: 2)
                navigate(to: Navigation.rewardID, from: self, shouldChangeRoot: true)
            } else {
                currentScreenIndex = GameConfig.button2Link
                giveRewards(with: 2)
            }
        }
        self.awake(withContext: nil)
    }
    
    @IBAction func option3Pressed() {
        if isLinkValid(GameConfig.button3Link) {
            if adventureComplete {
                giveRewards(with: 3)
                navigate(to: Navigation.rewardID, from: self, shouldChangeRoot: true)
            } else {
                currentScreenIndex = GameConfig.button3Link
                giveRewards(with: 3)
            }
        }
        self.awake(withContext: nil)
    }
}
