//
//  InterfaceController.swift
//  LearnTables WatchKit Extension
//
//  Created by Jacob Rozell on 12/26/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import WatchKit
import UIKit
import Foundation


class InterfaceController: WKInterfaceController {
    var multiArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    
    @IBAction func sliderChanged(_ value: Float) { createTimesTable(with: value) }
    @IBOutlet var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(multiArray.count, withRowType: "tableRowController")
        
        createTimesTable(with: 6.0)
        setupRowNums()
    }
    
    func createTimesTable(with value: Float) {
        updateTable(with: multiArray.map { $0 * Int(value) })
    }
    
    func updateTable(with array: [Int]) {
        for (index, text) in array.enumerated() {
            let row = table.rowController(at: index) as! TableRowController
            row.rowLabel.setText(String(text))
        }
    }
    
    func setupRowNums() {
        for (index, text) in multiArray.enumerated() {
            let row = table.rowController(at: index) as! TableRowController
            row.rowNum.setText("\(text).")
        }
    }
}
