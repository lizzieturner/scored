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

    @IBOutlet weak var switchController: UISwitch!
    var delegate: LaunchScreenDelegate?
    @IBOutlet var myButtons: [UIButton]!
    @IBOutlet var myLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
/*        // MARK: Dark Mode Settings
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")  // Retrieve the state
        
        if isDarkMode == true {
            view.backgroundColor = UIColor.black
            UILabel.appearance().textColor = UIColor.white
            button.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            view.backgroundColor = UIColor.white
            UILabel.appearance().textColor = UIColor.black
        } */
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
        @IBAction func toggleDarkMode(_ sender: UISwitch) {
            if switchController.isOn == true {
              /*  UserDefaults.standard.set(true, forKey: "isDarkMode") */
                view.backgroundColor = UIColor.black
                for button in self.myButtons {
                    button.titleLabel?.textColor = UIColor.white
                }
                for label in self.myLabels {
                    label.textColor = UIColor.white
                }
                
            }
            else {
              /*  UserDefaults.standard.set(false, forKey: "isDarkMode") */
                view.backgroundColor = UIColor.white
                for button in self.myButtons {
                    button.titleLabel?.textColor = UIColor.black
                }
                for label in self.myLabels {
                    label.textColor = UIColor.black
                }
            }
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

