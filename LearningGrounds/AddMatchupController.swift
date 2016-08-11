//
//  AddMatchupController.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/4/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import UIKit

class AddMatchupController: UIViewController {
    
    var delegate: AddNewMatchup?
    var gameId : String!
    
    @IBOutlet weak var playerOne: UITextField!
    @IBOutlet weak var playerTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        self.delegate?.updateData(MatchupObject(matchupId: NSUUID().UUIDString, gameId: gameId ,playerOne: PlayerObject(playerName: playerOne.text, playerId: NSUUID().UUIDString), playerTwo: PlayerObject(playerName: playerTwo.text, playerId: NSUUID().UUIDString))!)
    }
}
