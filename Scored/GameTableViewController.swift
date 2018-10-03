//
//  GameTableViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/1/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController, PlayerCellDelegate, ScoreboardDelegate {
    var gameProvider: GameProvider?
    var updateScoreTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.alwaysBounceVertical = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // make one section only
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // make number of rows equal number of players
        return gameProvider?.game?.players.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //table view cells are reused and dequeued using a cell identifier
        let cellIdentifier = "PlayerTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell else {
                fatalError("The dequeued cell is not an instance of PlayerTableViewCell")
        }

        // fetches appropriate player for cell
        cell.player = gameProvider?.game?.players[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - PlayerCellDelegate
    
    func didUpdateScore() {
        if let timer = updateScoreTimer {
            timer.invalidate()
        }
        updateScoreTimer = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false, block: { _ in
            self.gameProvider?.game?.players.sort() {$0.score > $1.score }
            self.tableView.reloadData()
        })
        self.tableView.reloadData()
    }
    
    // MARK: - ScoreboardDelegate
    
    func updateGame() {
        tableView.reloadData()
    }
    
    // Swipe right to delete player cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gameProvider?.game?.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
