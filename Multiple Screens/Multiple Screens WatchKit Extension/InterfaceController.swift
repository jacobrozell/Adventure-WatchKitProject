//
//  InterfaceController.swift
//  Multiple Screens WatchKit Extension
//
//  Created by Jacob Rozell on 12/26/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("App launched")
    }
    
    override func willActivate() {
        super.willActivate()
        print("Screen 1 is visable")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        print("Screen 1 is hidden")
    }

}
