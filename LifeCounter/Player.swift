//
//  Player.swift
//  LifeCounter
//
//  Created by Helen Li on 4/29/22.
//

import Foundation

// Creates a Player object
class Player {
    var score : Int
    
    init() {
        self.score = 20
    }
    
    func incOne() {
        score += 1
    }
    
    func incVal(_ value: Int) {
        score += value
    }
    
    func decOne() {
        score -= 1
    }
    
    func decVal(_ value: Int) {
        score -= value
    }
    
    func gameOver() -> Bool {
        return score <= 0
    }
    
}
