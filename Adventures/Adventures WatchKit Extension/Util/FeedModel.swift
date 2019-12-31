//
//  FeedModel.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import UIKit

// MARK: - FeedModel
private struct ClassFeed: Codable {
    let choices: [Option]

    init(choices: [Option]) {
        self.choices = choices
    }
}

struct ScreenFeed: Codable {
    let screen1: Screen
    let screen2: Screen
    
    init(screen1: Screen, screen2: Screen) {
        self.screen1 = screen1
        self.screen2 = screen2
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        screen1 = try container.decode(Screen.self, forKey: .screen1)
        screen2 = try container.decode(Screen.self, forKey: .screen2)
    }
    
    private enum CodingKeys: CodingKey {
        case screen1, screen2
    }
}

// Screen and Parsing
struct Screen: Codable {
    let text: String
    let subtext: String
    
    init(text: String, subtext: String) {
        self.text = text
        self.subtext = subtext
    }
    
    init() {
        self.init(text: "", subtext: "")
    }
}

private struct Option: Codable {
    let choice: String
    let screenLink: Int
    
    init(choice: String, screenLink: Int) {
        self.choice = choice
        self.screenLink = screenLink
    }
}

// MARK: - Parser
class ScreenParser {
    func parseObjectOfScreenFeedFromData(_ data: Data?) -> ScreenFeed? {
        guard let dataIn = data else { return nil }
        if let result = try? JSONDecoder().decode(ScreenFeed.self, from: dataIn) {
            return result
        }
        return ScreenFeed(screen1: Screen(), screen2: Screen())
    }
}
