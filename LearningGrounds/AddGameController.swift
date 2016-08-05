//
//  AddGameController.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/2/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import UIKit

class AddGameController: UIViewController {
    @IBOutlet weak var gameNameText: UITextField!
    @IBOutlet weak var randomSwitch: UISwitch!
    
    var delegate: AddNewGame!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let trimmedGameName: String? = gameNameText.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if trimmedGameName != "" {
            self.delegate?.updateData(GameObject(gameId: 1, gameName: gameNameText.text!, isRandom: randomSwitch.on))
        }
    }
}
