//
//  RewardScreen.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/15/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit

class RewardScreen: WKInterfaceController {

    // MARK: - IBOutlets
    @IBOutlet var expPointsLabel: WKInterfaceLabel!
    @IBOutlet var factionPointsLabel: WKInterfaceLabel!
    @IBOutlet var moneyLabel: WKInterfaceLabel!
    
    // MARK: - IBActions
    @IBAction func goToHomeScreenPressed() {
        Navigation.navigate(to: Navigation.homeID, from: self, shouldChangeRoot: true)
    }
    
    var expToGive = 0.0
    var factionPointsToGive = 0
    var moneyToGive = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: nil)
        calcRewards()
        updateLabels()
    }
    
    // MARK: - Functions
    private func calcRewards() {
        for reward in PlayerStats.__playerRewardsForAdventure {
            expToGive += reward.exp
            factionPointsToGive += reward.factionPoints
            moneyToGive += reward.money
        }
        giveRewardsToPlayer()
    }
    
    private func giveRewardsToPlayer() {
        PlayerStats.__playerExp += expToGive
        PlayerStats.__playerFactionPoints += factionPointsToGive
        PlayerStats.__playerMoney += moneyToGive
        
        // Check to see if leveled up
    }
    
    private func updateLabels() {
        expPointsLabel.setText("\(expToGive)")
        factionPointsLabel.setText("\(factionPointsToGive)")
        moneyLabel.setText("$\(moneyToGive)")
    }
    
}
