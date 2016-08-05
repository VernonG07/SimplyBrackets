//
//  ViewController.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/1/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewGame {

    var mGame :GameObject!
    static let done = "done"
    static let newGameModal = "newGameModal"
    static let gameView = "GameSegue"
    static let cell = "cell"
    static let rowHeight: CGFloat! = 75.0

    @IBOutlet weak var mTable: UITableView!
    
    @IBAction func unwindToGamesList(sender: UIStoryboardSegue) {
        if sender.identifier == ViewController.done {
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        
        let uiNavigationController = segue.destinationViewController as! UINavigationController
        
        
        if segue.identifier == ViewController.newGameModal {
            let addGameVC = uiNavigationController.topViewController as! AddGameController
            addGameVC.delegate = self
        } else if segue.identifier == ViewController.gameView {
            let gameVC = uiNavigationController.topViewController as! CurrentGameTableViewController

            gameVC.mGame = mGame
        }
    }
    
    var gameItems = [GameObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTable.dataSource = self
        mTable.delegate = self
        mTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: ViewController.cell)
        mTable.rowHeight = ViewController.rowHeight
        
        if gameItems.count > 0 {
            return
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameItems.count
    }
    
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ViewController.cell,
                                                               forIndexPath: indexPath)
        let item = gameItems[indexPath.row]
        cell.textLabel?.text = item.gameName
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("GameSegue", sender: self)
        
    }
    
    func updateData(data: GameObject) {
        mGame = data
        let newIndexPath = NSIndexPath(forRow: gameItems.count, inSection: 0)
        gameItems.append(data)
        mTable.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
    }
    
    
}

