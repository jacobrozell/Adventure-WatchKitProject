//
//  Config.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/29/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import UIKit

enum GameConfig {
    
    // MARK: - Player Class Constants
    enum PlayableClass: String, Decodable {
        case mage = "mage"
        case warrior = "warrior"
        case unset = "unset"
    }
    
    public static var chosenClass = false
    public static var playerClass: PlayableClass = .unset
    
    public static var characterCreationICID = "characterCreationScreen"
    
    public static var userDefaults = UserDefaults.standard
    
    
}

enum UserDefaultsKeys {
    public static var playerClass = "playerClass"
}
