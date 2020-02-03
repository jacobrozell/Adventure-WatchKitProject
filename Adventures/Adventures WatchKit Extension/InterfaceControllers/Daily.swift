//
//  Daily.swift
//  Adventures WatchKit Extension
//
//  Created by Jacob Rozell on 1/19/20.
//  Copyright © 2020 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit
import HealthKit

class Daily: WKInterfaceController {
    @IBOutlet var activityRing: WKInterfaceActivityRing!
    
    let energyUnit = HKUnit.jouleUnit(with: .kilo)//HKUnit.kilocalorie()
    let standUnit = HKUnit.count()
    let exerciseUnit = HKUnit.second()
    
    var energyProgress: Double = 0.0
    var standProgress: Double = 0.0
    var exerciseProgress: Double = 0.0
    
    override init() {
        super.init()
        requestAccess()
    }
    
    func requestAccess() {
        let objectTypes: Set<HKObjectType> = [
            HKObjectType.activitySummaryType()
        ]
        
        HKConfig.healthStore.requestAuthorization(toShare: nil, read: objectTypes) { (success, error) in
            if error != nil {
                return
            } else {
                self.getCurrentDay()
            }
        }
    }
    
    func getCurrentDay() {
        let calendar = Calendar.autoupdatingCurrent
                
        var dateComponents = calendar.dateComponents(
            [ .year, .month, .day ],
            from: Date()
        )

        dateComponents.calendar = calendar

        let predicate = HKQuery.predicateForActivitySummary(with: dateComponents)
        
        query(with: predicate)
    }
    
    func query(with predicate: NSPredicate) {
        let query = HKActivitySummaryQuery(predicate: predicate) { (query, summaries, error) in
            guard let summaries = summaries, summaries.count > 0 else { return }
            
            let summary = summaries[0]
            
            let energy = summary.activeEnergyBurned.doubleValue(for: self.energyUnit)
            let stand = summary.appleStandHours.doubleValue(for: self.standUnit)
            let exercise = summary.appleExerciseTime.doubleValue(for: self.exerciseUnit)
            
            let energyGoal = summary.activeEnergyBurnedGoal.doubleValue(for: self.energyUnit)
            let standGoal = summary.appleStandHoursGoal.doubleValue(for: self.standUnit)
            let exerciseGoal = summary.appleExerciseTimeGoal.doubleValue(for: self.exerciseUnit)
            
            self.energyProgress = energyGoal == 0 ? 0 : energy / energyGoal
            self.standProgress = standGoal == 0 ? 0 : stand / standGoal
            self.exerciseProgress = exerciseGoal == 0 ? 0 : exercise / exerciseGoal
            
            self.activityRing.setActivitySummary(summary, animated: true)
            self.checkGoals()
        }
        HKConfig.healthStore.execute(query)
    }
    
    func checkGoals() {
        // check each goal and if it is 100% complete, add it to label
        
        
    }
    
}
