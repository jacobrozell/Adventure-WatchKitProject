//
//  DailyPick.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 2/3/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit

class DailyPick: WKInterfaceController {
    
    override func didAppear() {
        super.didAppear()
    }

    // Mark: - IBActions
    @IBAction func easyPressed() {
        print("easy")
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: Navigation.homeID, context: [:] as AnyObject), (name: Navigation.dailyTestID, context: [:] as AnyObject)])
        pushController(withName: Navigation.dailyTestID, context: [:] as AnyObject)
    }
    
    @IBAction func mediumPressed() {
        print("medium")
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: Navigation.homeID, context: [:] as AnyObject), (name: Navigation.dailyTestID, context: [:] as AnyObject)])
        pushController(withName: Navigation.dailyTestID, context: [:] as AnyObject)
    }
    
    @IBAction func hardPressed() {
        print("hard")
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: Navigation.homeID, context: [:] as AnyObject), (name: Navigation.dailyTestID, context: [:] as AnyObject)])
        pushController(withName: Navigation.dailyTestID, context: [:] as AnyObject)
        
    }
}
