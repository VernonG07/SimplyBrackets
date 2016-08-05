//
//  GameObject.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/2/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import Foundation

class GameObject {
    let gameName: String!
    let isRandom: Bool!
    let gameId: Int!
    
    init(gameId: Int, gameName: String, isRandom: Bool) {
        self.gameName = gameName
        self.isRandom = isRandom
        self.gameId = gameId
    }
}
