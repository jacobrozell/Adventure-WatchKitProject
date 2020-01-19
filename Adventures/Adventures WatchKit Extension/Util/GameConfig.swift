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

enum GameConfig {
    static var defaults = UserDefaults.standard.df
    static var playerStats = PlayerStats()
    static var playerClassName = "\(GameConfig.playerStats.__playerClass.rawValue.capitalized)"
    
    public static var userDefaults = UserDefaults.standard
    
    public static var screenFeed = ScreenFeed(screens: [])
    
    public static var button1Link = -99
    public static var button2Link = -99
    public static var button3Link = -99
    
    public static var rewards1: Reward = Reward()
    public static var rewards2: Reward = Reward()
    public static var rewards3: Reward = Reward()
    
    
}

enum UserDefaultsKeys {
    public static var playerClass = "playerClass"
}

enum Navigation {
    public static var homeID = "homeScreen"
    public static var profileID = "statsController"
    public static var classCreationID = "characterCreationScreen"
    public static var adventureID = "screenViewController"
    public static var rewardID = "rewardScreen"
    public static var dailyTestID  = "dailyTest"
    
    public static func navigate(to id: String, from controller: WKInterfaceController, shouldChangeRoot: Bool=false) {
        if shouldChangeRoot {
            WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: id, context: [:] as AnyObject)])
        }
        controller.pushController(withName: id, context: nil)
    }
}

func leaveAdventure(vc self: WKInterfaceController) {
    self.presentAlert(withTitle: "Leave the Adventure?", message: "", preferredStyle: .alert, actions: [WKAlertAction(title: "Yes", style: .default, handler: {
        
        self.popToRootController()
        
    }), WKAlertAction(title: "No", style: .cancel, handler: {
        return
    })])
}

func readJSONFromFile(fileName: String) -> Data? {
    var data: Data? = Data()
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
        } catch {
            // Handle error here
        }
    }
    return data
}
