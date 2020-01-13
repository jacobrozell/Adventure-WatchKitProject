//
//  Config.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/29/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

// MARK: - Player Class Constants
enum PlayableClass: String, Codable {
    case mage = "mage"
    case warrior = "warrior"
    case unset = "unset"
}

enum GameConfig {

    public static var chosenClass = false
    static var playerClass: PlayableClass = .unset

    public static var characterCreationICID = "characterCreationScreen"
    public static var userDefaults = UserDefaults.standard
    
    public static var screenID = "screenViewController"
    public static var screenFeed = ScreenFeed(screens: [])
    
    public static var profileViewID = "profileView"
    public static var statsScreen = "statsController"
    
    public static var button1Link = -99
    public static var button2Link = -99
    public static var button3Link = -99
    
    public static var rewards1: Reward = Reward()
    public static var rewards2: Reward = Reward()
    public static var rewards3: Reward = Reward()
    
    public static var __playerRewardsForAdventure: [Reward] = []
    
    // Probably need to make these keys somewhere else
    public static var __playerLevel = 1
    public static var __playerMoney = 0
    public static var __playerExp: Float = 0.0
    public static var __playerFactionPoints = 0
}

enum UserDefaultsKeys {
    public static var playerClass = "playerClass"
}

func navigate(to id: String, from controller: WKInterfaceController, shouldChangeRoot: Bool=false) {
    if shouldChangeRoot {
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: id, context: [:] as AnyObject)])
    }
    controller.pushController(withName: id, context: nil)
}

func leaveAdventure(vc self: WKInterfaceController) {
    self.presentAlert(withTitle: "Leave the Adventure?", message: "", preferredStyle: .alert, actions: [WKAlertAction(title: "Yes", style: .default, handler: {
        
        self.popToRootController()
        
    }), WKAlertAction(title: "No", style: .cancel, handler: {
        return
    })])
}
