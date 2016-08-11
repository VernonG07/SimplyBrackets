//
//  CurrentGameTableViewController.swift
//  LearningGrounds
//
//  Created by Matt Griffin on 8/4/16.
//  Copyright © 2016 Matt Griffin. All rights reserved.
//

import UIKit

class CurrentGameTableViewController: UITableViewController, AddNewMatchup{
    @IBOutlet var mTableView: UITableView!
    
    //Current Game
    var mGame: GameObject?
    var matchups = [MatchupObject]()
    
    var currentRound : Int! = 1
    
    func updateData(data: MatchupObject) {

        matchups.append(data)
        if NSKeyedArchiver.archiveRootObject(matchups, toFile: data.returnURL().path!) {
            print ("saved matchups")
        } else {
            print( "save failed")
        }

        mTableView.reloadData()
        
    }
    
    @IBAction func unwindToCurrentGameTable(sender: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "openNewMatchup" {
            let uiNavigationController = segue.destinationViewController as! UINavigationController
            let addMatchupVC = uiNavigationController.topViewController as! AddMatchupController
            addMatchupVC.delegate = self
            addMatchupVC.gameId = mGame?.gameId!
        } else if segue.identifier == "nextround" {
            let uiNavigationController = segue.destinationViewController as! UINavigationController
            let startNewRoundVC = uiNavigationController.topViewController as! CurrentGameTableViewController
            startNewRoundVC.mGame = mGame
            startNewRoundVC.currentRound = currentRound + 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTableView.separatorStyle = .None
        mTableView.dataSource = self
        mTableView.delegate = self
        
        if mGame!.gameName != nil {
            self.title = (mGame?.gameName!)! + "(Round \(currentRound))"
        }
        
        if currentRound != 1 {
            self.navigationItem.rightBarButtonItem?.enabled = false
        }

        if currentRound == 1 {
            for item in self.toolbarItems! {
                if item.title == "Previous Round" {
                    item.enabled = false
                }
            }
        }
        
        
        let matchups = NSKeyedUnarchiver.unarchiveObjectWithFile(MatchupObject.ArchiveBaseURL.path! + mGame!.gameId) as? [MatchupObject]
        
        if matchups?.count > 0 {
            self.matchups = matchups!
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchups.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        
        let playOne = matchups[indexPath.row].playerOne
        let playTwo = matchups[indexPath.row].playerTwo
        
        cell.teamOneLabel.text = playOne
        cell.teamTwoLabel.text = playTwo
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
