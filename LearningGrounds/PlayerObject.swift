//
//  PlayerObject.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/4/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import Foundation

class PlayerObject {
    let playerName: String!
    let playerId: String!
    
    init(playerName: String!, playerId: String!) {
        self.playerId = playerId
        self.playerName = playerName
    }
}
