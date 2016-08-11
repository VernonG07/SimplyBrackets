//
//  MatchupObject.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/4/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import Foundation

class MatchupObject : NSObject, NSCoding {
    
    let matchupId : String!
    let gameId : String!
    let playerOne : String!
    let playerTwo : String!

    
    static let DocumentsBaseDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveBaseURL = DocumentsBaseDirectory.URLByAppendingPathComponent(KeyManager.MatchupKeyManager.matchup)
    let ArchiveURL : NSURL
    
    init?(matchupId: String!, gameId: String!, playerOne: PlayerObject!, playerTwo:PlayerObject!) {
        self.matchupId = matchupId
        self.gameId = gameId
        self.playerOne = playerOne.playerName!
        self.playerTwo = playerTwo.playerName!
        
        ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent(KeyManager.MatchupKeyManager.matchup + gameId)
        
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {

        let matchupId = aDecoder.decodeObjectForKey(KeyManager.MatchupKeyManager.matchupId) as! String
        let gameId = aDecoder.decodeObjectForKey(KeyManager.MatchupKeyManager.gameId) as! String
        let matchupPlayerOne = aDecoder.decodeObjectForKey(KeyManager.MatchupKeyManager.matchupPlayerOne) as! String
        let matchupPlayerTwo = aDecoder.decodeObjectForKey(KeyManager.MatchupKeyManager.matchupPlayerTwo) as! String
        
        self.init(matchupId: matchupId, gameId: gameId, playerOne: PlayerObject(playerName: matchupPlayerOne, playerId: "1"), playerTwo: PlayerObject(playerName: matchupPlayerTwo, playerId: "1"))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(gameId, forKey: KeyManager.MatchupKeyManager.gameId)
        aCoder.encodeObject(matchupId, forKey: KeyManager.MatchupKeyManager.matchupId)
        aCoder.encodeObject(playerOne, forKey: KeyManager.MatchupKeyManager.matchupPlayerOne)
        aCoder.encodeObject(playerTwo, forKey: KeyManager.MatchupKeyManager.matchupPlayerTwo)
    }
    
    func returnURL() -> NSURL {
        return ArchiveURL
    }
    
}