//
//  InterfaceController.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import WatchKit
import Foundation

class CharacterCreationScreen: WKInterfaceController {
    
    override init() {
        super.init()
        checkIfNewPlayer()
    }
    
    // MARK: - IBActions
    @IBAction func mageSelected(_ sender: Any) {
        chooseClass(with: .mage)
    }
    
    @IBAction func warriorSelected(_ sender: Any) {
        chooseClass(with: .warrior)
    }
    
    // MARK: - Functions
    func chooseClass(with pClass: PlayableClass) {
        self.presentAlert(withTitle: "\(pClass.rawValue.capitalized) Selected!", message: "Are you sure?", preferredStyle: .alert, actions: [WKAlertAction(title: "Yes", style: .default, handler: {
            
            GameConfig.playerStats.__playerClass = pClass
            GameConfig.playerStats.__chosenClass = true
            GameConfig.defaults.store(GameConfig.playerStats, forKey: UserDefaultsKeys.playerClass)
            
            Navigation.reloadPages()
            
//            Navigation.navigate(to: Navigation.homeID, from: self, shouldChangeRoot: true)
            
        }), WKAlertAction(title: "No", style: .cancel, handler: {
            return
        })])
    }
    
    func checkIfNewPlayer() {
//        if let p = GameConfig.defaults.fetch(forKey: UserDefaultsKeys.playerClass, type: PlayerStats.self) {
//            if p.__playerClass == .unset || !p.__chosenClass {
//                Navigation.navigate(to: Navigation.classCreationID, from: self, shouldChangeRoot: true)
//            }
//        } else {
//            Navigation.navigate(to: Navigation.classCreationID, from: self, shouldChangeRoot: true)
//
//        }
//
        if let p = GameConfig.defaults.fetch(forKey: UserDefaultsKeys.playerClass, type: PlayerStats.self) {
            if p.__playerClass != .unset || p.__chosenClass {
                Navigation.reloadPages()
            }
        }
    }
}
