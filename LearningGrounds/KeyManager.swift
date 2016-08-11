//
//  KeyManager.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/8/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import Foundation

class KeyManager {
    
    struct GameKeyManager {
        static let game = "games"
        static let gameName = "gameName"
        static let gameId = "gameId"
        static let isRandom = "isRandom"
    }
    
    struct PlayerKeyManager {
        static let player = "players"
        static let playerOneName = "playerOneName"
        static let playerTwoName = "playerTwoName"
    
    }
    
    struct MatchupKeyManager {
        static let matchup = "matchups"
        static let matchupId = "matchupId"
        static let gameId = "matchupGameId"
        static let matchupPlayerOne = "matchupPlayerOne"
        static let matchupPlayerTwo = "matchupPlayerTwo"
    }
}
