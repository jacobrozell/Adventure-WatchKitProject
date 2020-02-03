//
//  StatsControlelr.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/13/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit

class ProfileController: WKInterfaceController {
    @IBOutlet var expLabel: WKInterfaceLabel!
    @IBOutlet var factionPoints: WKInterfaceLabel!
    @IBOutlet var moneyLabel: WKInterfaceLabel!
    @IBOutlet var classLabel: WKInterfaceLabel!
    @IBOutlet var levelLabel: WKInterfaceLabel!
    
    override init() {
        super.init()
        classLabel.setText(GameConfig.playerClassName)
        expLabel.setText("\(GameConfig.playerStats.__playerExp)")
        factionPoints.setText("\(GameConfig.playerStats.__playerFactionPoints)")
        moneyLabel.setText("$ \(GameConfig.playerStats.__playerMoney)")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: nil)
        
        classLabel.setText(GameConfig.playerClassName)
        expLabel.setText("\(GameConfig.playerStats.__playerExp)")
        factionPoints.setText("\(GameConfig.playerStats.__playerFactionPoints)")
        moneyLabel.setText("$ \(GameConfig.playerStats.__playerMoney)")
    }
}
