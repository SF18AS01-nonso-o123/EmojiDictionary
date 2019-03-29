//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Chinonso Obidike on 2/13/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import Foundation;

struct Emoji: Codable {
    
    static var archiveURL: URL {
        guard let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("FileManager.default.urls returned an empty array");
        }
        
        return documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist");
    }
    
    var symbol: String;
    var name: String;
    var description: String;
    var usage: String;
    
    
    //Called from viewDidLoad().
    static func loadFromFile() -> [Emoji] {
        guard let data: Data = try? Data(contentsOf: archiveURL) else {
            return []
        }
        
        let propertyListDecoder: PropertyListDecoder = PropertyListDecoder()
        
        guard let emojis: [Emoji] = try? propertyListDecoder.decode([Emoji].self, from: data) else {
            fatalError("could not decode Data read from file \(archiveURL)");
        }
        return emojis
    }
    
    
    //Called from property observer for emojis.
    
    static func saveToFile(emojis: [Emoji]) {
        let properListEncoder: PropertyListEncoder = PropertyListEncoder()
        
        guard let data: Data = try? properListEncoder.encode(emojis) else {
            fatalError("could not encode \(emojis) as Data");
        }
        
        if (try? data.write(to: archiveURL, options: .noFileProtection)) == nil {
            fatalError("could not write Data to file \(archiveURL)");
        }
    }
    
    
    static func loadSampleEmojis() -> [Emoji] {
        return [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
            Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue 'z's.", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black and white checkered flag.", usage: "completion")
        ];
    }
}
