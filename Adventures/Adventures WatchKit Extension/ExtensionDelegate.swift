//
//  ExtensionDelegate.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {}

    func applicationDidBecomeActive() {}

    func applicationWillResignActive() {
        GameConfig.defaults.store(GameConfig.playerStats, forKey: UserDefaultsKeys.playerClass)
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task in backgroundTasks {
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                backgroundTask.setTaskCompletedWithSnapshot(false)
                
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
                
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                connectivityTask.setTaskCompletedWithSnapshot(false)
                
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                urlSessionTask.setTaskCompletedWithSnapshot(false)
                
            case let relevantShortcutTask as WKRelevantShortcutRefreshBackgroundTask:
                relevantShortcutTask.setTaskCompletedWithSnapshot(false)
                
            case let intentDidRunTask as WKIntentDidRunRefreshBackgroundTask:
                intentDidRunTask.setTaskCompletedWithSnapshot(false)
                
            default:
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }
}
