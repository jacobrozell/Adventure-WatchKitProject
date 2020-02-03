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

class HomeScreen: WKInterfaceController {
    @IBAction func adventuresPressed() {
        Navigation.navigate(to: Navigation.adventureID, from: self, shouldChangeRoot: true)
    }
    
    @IBAction func profileButtonPressed() {
        Navigation.navigate(to: Navigation.profileID, from: self)
    }
    
    @IBAction func dailyPressed() {
        Navigation.navigate(to: Navigation.dailyPickID, from: self)
    }
}
