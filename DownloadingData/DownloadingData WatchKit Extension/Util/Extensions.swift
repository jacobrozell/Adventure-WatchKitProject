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

//    //MARK: Check Login
//    func setLoggedIn(value: Bool) {
//        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
//        //synchronize()
//    }
//
//    func isLoggedIn()-> Bool {
//        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
//    }
//
//    //MARK: Save User Data
//    func setUserID(value: Int){
//        set(value, forKey: UserDefaultsKeys.userID.rawValue)
//        //synchronize()
//    }
//
//    //MARK: Retrieve User Data
//    func getUserID() -> Int{
//        return integer(forKey: UserDefaultsKeys.userID.rawValue)
//    }
}
