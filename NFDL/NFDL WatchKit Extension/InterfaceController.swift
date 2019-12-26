//
//  InterfaceController.swift
//  PlayingSounds WatchKit Extension
//
//  Created by Jacob Rozell on 12/26/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {
    var player = AVAudioPlayer()
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var playButton: WKInterfaceButton!
    
    @IBAction func playPressed() {
        if player.isPlaying {
            player.stop()
            image.stopAnimating()
            return
        }
        guard let soundPath = Bundle.main.path(forResource: "nfdl", ofType: "mp3") else { return }
        let soundPathURL = URL(fileURLWithPath: soundPath)

        image.setImageNamed("f")
        
        do {
            player = try AVAudioPlayer(contentsOf: soundPathURL)
            player.prepareToPlay()
            
            player.play()
            image.startAnimatingWithImages(in: NSRange(location: 2, length: 36), duration: 4.02, repeatCount: 1)
        } catch {
            print(error)
        }
        

    }
}
