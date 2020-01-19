//
//  PlayerConfig.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/19/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import Foundation
import UIKit
import Default

// MARK: - Player Class Constants
enum PlayableClass: String, Codable {
    case mage = "mage"
    case warrior = "warrior"
    case unset = "unset"
}

struct PlayerStats: Codable, DefaultStorable {
    var __chosenClass = false
    var __playerClass: PlayableClass = .unset
    var __playerRewardsForAdventure: [Reward] = []
    var __playerLevel = 1
    var __playerMoney = 0
    var __playerExp = 0.0
    var __playerFactionPoints = 0
}
