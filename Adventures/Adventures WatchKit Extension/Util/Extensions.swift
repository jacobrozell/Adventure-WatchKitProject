//
//  Extensions.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/29/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import WatchKit

extension UserDefaults {
    
    // MARK: - PlayerClass
    func setPlayerClass(to value: PlayableClass) {
        set(value, forKey: UserDefaultsKeys.playerClass)
    }

}

