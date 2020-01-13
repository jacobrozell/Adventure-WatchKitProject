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

class ProfileMainView: WKInterfaceController {
    @IBAction func adventuresPressed() {
        pushController(withName: GameConfig.screenID, context: nil)
    }
    
    @IBAction func profileButtonPressed() {
        pushController(withName: GameConfig.statsScreen, context: nil)
    }
    
    
    
    
}
