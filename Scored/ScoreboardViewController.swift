//
//  ScoreboardViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/1/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

protocol ScoreboardDelegate {
    func add(_ player: Player)
}

class ScoreboardViewController: UIViewController, NewPlayerDelegate {
    
    private var delegate: ScoreboardDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedTableView" {
            self.delegate = segue.destination as! GameTableViewController
        } else if segue.identifier == "addNewPlayer" {
            let newPlayerViewController = segue.destination as! NewPlayerViewController
            newPlayerViewController.delegate = self
        }
    }
    
    func didCreatePlayer(_ player: Player) {
        self.delegate?.add(player)
    }
/*
     // old add player functionality
    @IBAction func addNewPlayer(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Player", message: "Enter player name.", preferredStyle: .alert)
        alert.addTextField { (playerNameTextField) in
            playerNameTextField.placeholder = "Player Name"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] _ in
            guard let textField = alert?.textFields?.first else {
                print("Alert has no textfield")
                return
            }
            
            self.delegate?.add(Player(name: textField.text!))
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    */
    
    
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
