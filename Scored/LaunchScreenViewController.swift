//
//  LaunchScreenViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/2/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

protocol LaunchScreenDelegate {
    func add(_ game: Game)
}

class LaunchScreenViewController: UIViewController {

    var delegate: LaunchScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createNewGame(_ sender: Any) {
        
        let alert = UIAlertController(title: "Enter Game Name", message: "", preferredStyle: .alert)
        alert.addTextField { (gameNameTextField) in
            gameNameTextField.placeholder = "Game Name"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] _ in
            guard let textField = alert?.textFields?.first else {
                print("Alert has no textfield")
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let scoreboard = storyboard.instantiateViewController(withIdentifier: "scoreboardViewController") as! ScoreboardViewController
            scoreboard.game = Game(name: textField.text!)
            self.present(scoreboard, animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func loadExistingGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // TODO: finish implementing dark mode toggle
        @IBAction func toggleDarkMode(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
