//
//  ProfileMainView.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/5/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit
import Foundation

class HomeScreen: WKInterfaceController {
    
    override func didAppear() {
        checkIfNewPlayer()
        
        // Allows for ONE check, instead of several throughout the application 
        if let p = GameConfig.defaults.fetch(forKey: UserDefaultsKeys.playerClass, type: PlayerStats.self) {
            GameConfig.playerStats = p
        }
    }
    
    @IBAction func adventuresPressed() {
        // need to download data here
        //LoadingScreen().downloadFeed()
        pushController(withName: Navigation.loadingID, context: nil)
        //Navigation.navigate(to: Navigation.adventureID, from: self, shouldChangeRoot: true)
    }
    
    func checkIfNewPlayer() {
        if let p = GameConfig.defaults.fetch(forKey: UserDefaultsKeys.playerClass, type: PlayerStats.self) {
            if p.__playerClass == .unset || !p.__chosenClass {
                Navigation.navigate(to: Navigation.classCreationID, from: self, shouldChangeRoot: true)
            }
        } else {
            Navigation.navigate(to: Navigation.classCreationID, from: self, shouldChangeRoot: true)
        }
        
    }
}
