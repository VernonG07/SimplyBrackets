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
    
    @IBOutlet weak var playerOne: UITextField!
    @IBOutlet weak var playerTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("sending data")
         self.delegate?.updateData(MatchupObject(playerOne: PlayerObject(playerName: playerOne.text), playerTwo: PlayerObject(playerName: playerTwo.text)))
    }
}
