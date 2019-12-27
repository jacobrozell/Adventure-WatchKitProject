//
//  LoadingScreen.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import UIKit
import WatchKit

class LoadingScreen: WKInterfaceController {
    
    var screenFeed: ScreenFeed? = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        downloadFeed()
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    func downloadFeed() {
        let url = URL(string: "https://api.myjson.com/bins/ai6p0")
        
        let session = URLSession.shared.dataTask(with: url!, completionHandler : { (data, response, error) -> Void in
            
            if error != nil {
                print(String(describing: error?.localizedDescription))
                return
            }
            
            guard let data = data else { return }

            self.screenFeed = ScreenParser().parseObjectOfScreenFeedFromData(data)
            
            self.checkDownload()
        })
        
        session.resume()
    }
    
    func checkDownload() {
        if screenFeed != nil {
            presentAlert(withTitle: "Download Data Complete!", message: "", preferredStyle: .alert, actions: [WKAlertAction(title: "Okay", style: .default, handler: {
                // go to character screen
                
                let rootControllerIdentifier = "characterCreationScreen"
                WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: rootControllerIdentifier, context: [:] as AnyObject)])
                
                self.pushController(withName: rootControllerIdentifier, context: nil)
            })])
        } else {
            presentAlert(withTitle: "Download Data Failed!", message: "Check Internet Connection", preferredStyle: .alert, actions: [WKAlertAction(title: "Try Again", style: .default, handler: {
                self.downloadFeed()
            })])
        }
        
    }
}
