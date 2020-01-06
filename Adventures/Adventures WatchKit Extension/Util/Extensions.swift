//
//  Extensions.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/29/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    // MARK: - PlayerClass
    func setPlayerClass(to value: GameConfig.PlayableClass) {
        set(value, forKey: UserDefaultsKeys.playerClass)
    }

}
