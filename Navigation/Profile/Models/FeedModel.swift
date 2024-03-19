//
//  FeedModel.swift
//  Navigation
//
//  Created by Apple Mac Air on 18.01.2023.
//

import Foundation

class FeedModel {
    
    var secretWord = "Password"
    
    func check(_ word: String) -> Bool {
        return word == secretWord
    }
}
