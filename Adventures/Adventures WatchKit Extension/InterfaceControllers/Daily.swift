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
    
    let objectTypes: Set<HKObjectType> = [
        HKObjectType.activitySummaryType()
    ]
    
    let energyUnit = HKUnit.jouleUnit(with: .kilo)//HKUnit.kilocalorie()
    let standUnit = HKUnit.count()
    let exerciseUnit = HKUnit.second()

    override init() {
        super.init()
        requestAccess()
        
    }
    
//    func checkAccess() {
//        if HKConfig.permission {
//            getCurrentDay()
//        } else {
//            let permission = requestAccess()
//            if permission {
//                HKConfig.permission = true
//                getCurrentDay()
//            } else {
//                self.popToRootController()
//            }
//        }
//    }
    
//    func checkAccess() {
//        let permission = requestAccess()
//        if permission {
//            getCurrentDay()
//        } else {
//            popToRootController()
//        }
//    }
    
    func requestAccess() {
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
            
            let energyProgress = energyGoal == 0 ? 0 : energy / energyGoal
            let standProgress = standGoal == 0 ? 0 : stand / standGoal
            let exerciseProgress = exerciseGoal == 0 ? 0 : exercise / exerciseGoal
            
            self.activityRing.setActivitySummary(summary, animated: true)
        }
        HKConfig.healthStore.execute(query)
    }
    
}
