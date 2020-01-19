//
//  LoadingScreen.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import UIKit
import WatchKit

class LoadingScreen: WKInterfaceController {
    
    var screenFeed: ScreenFeed? = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        downloadFeed()
    }

    func downloadFeed() {
        let data = readJSONFromFile(fileName: "introFeed")
        self.screenFeed = ScreenParser().parseObjectOfScreenFeedFromData(data)
        self.checkDownload()
//        let url = URL(string: GameConfig.introFeed)
//
//        let session = URLSession.shared.dataTask(with: url!, completionHandler : { (data, response, error) -> Void in
//
//            if error != nil {
//                print(String(describing: error?.localizedDescription))
//                return
//            }
//
//            guard let data = data else { return }
//
//            self.screenFeed = ScreenParser().parseObjectOfScreenFeedFromData(data)
//            self.checkDownload()
//        })
//        session.resume()
    }
    
    func checkDownload() {
        guard let feed = screenFeed else {
            presentDownloadError()
            return
        }
        
        GameConfig.screenFeed = feed
        
        presentAlert(withTitle: "Download Data Complete!", message: "", preferredStyle: .alert, actions: [WKAlertAction(title: "Okay", style: .default, handler: {
            
            // TODO: NEED TO CONVERT THIS TO USERDEFAULTS
            // #warning("Need the check this ")
            
//                if GameConfig.userDefaults.getPlayerClass() != nil {
//
//                }
            
            if !GameConfig.chosenClass {
                Navigation.navigate(to: Navigation.classCreationID, from: self, shouldChangeRoot: true)
                
            } else {
                Navigation.navigate(to: Navigation.homeID, from: self, shouldChangeRoot: true)
            }
        })])
    }
    
    func presentDownloadError() {
        presentAlert(withTitle: "Download Data Failed!", message: "Check Internet Connection", preferredStyle: .alert, actions: [WKAlertAction(title: "Try Again", style: .default, handler: {
            self.downloadFeed()
        })])
    }
}
