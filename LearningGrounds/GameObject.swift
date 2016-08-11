//
//  GameObject.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/2/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import UIKit

class GameObject : NSObject, NSCoding {
    var gameName: String!
    var isRandom: Bool!
    var gameId: String!
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent(KeyManager.GameKeyManager.game)

    init?(gameId: String, gameName: String, isRandom: Bool) {
        self.gameName = gameName
        self.isRandom = isRandom
        self.gameId = gameId
        
        super.init()
        
        if gameName.isEmpty {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let game = aDecoder.decodeObjectForKey(KeyManager.GameKeyManager.gameName) as! String
        let isRandom = aDecoder.decodeObjectForKey(KeyManager.GameKeyManager.isRandom) as! Bool
        let gameId = aDecoder.decodeObjectForKey(KeyManager.GameKeyManager.gameId) as! String
        
        self.init(gameId: gameId, gameName: game, isRandom: isRandom)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(gameName, forKey:KeyManager.GameKeyManager.gameName)
        aCoder.encodeObject(isRandom, forKey: KeyManager.GameKeyManager.isRandom)
        aCoder.encodeObject(gameId, forKey: KeyManager.GameKeyManager.gameId)
    }
}
