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
    
    // MARK: - IBActions
    @IBAction func mageSelected(_ sender: Any) {
        chooseClass(with: .mage)
    }
    
    @IBAction func warriorSelected(_ sender: Any) {
        chooseClass(with: .warrior)
    }
    
    func chooseClass(with pClass: PlayableClass) {
        self.presentAlert(withTitle: "\(pClass.rawValue.capitalized) Selected!", message: "Are you sure?", preferredStyle: .alert, actions: [WKAlertAction(title: "Yes", style: .default, handler: {
            
            GameConfig.playerClass = pClass
            //GameConfig.userDefaults.setPlayerClass(to: pClass)
            GameConfig.chosenClass = true
            
            navigate(to: Navigation.homeID, from: self, shouldChangeRoot: true)
            
        }), WKAlertAction(title: "No", style: .cancel, handler: {
            return
        })])
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
