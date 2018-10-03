//
//  NewPlayerViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 10/2/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

protocol NewPlayerDelegate {
    func didCreatePlayer(_ player: Player)
}

class NewPlayerViewController: UIViewController {

    var delegate: NewPlayerDelegate?
    let numberToolbar: UIToolbar = UIToolbar()
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var startingScore: UITextField!
    weak var colorButton: UIButton?
    var playerColor = UIColor.gray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.done, target: self, action: #selector(NewPlayerViewController.dismissKeyboard))
        ]
        
        numberToolbar.sizeToFit()
        
        startingScore.inputAccessoryView = numberToolbar
        
        playerName.becomeFirstResponder()
    }
    
   @IBAction func dismissKeyboard(_ sender: Any) {
        startingScore.resignFirstResponder()
    }
    
    @IBAction func didBeginEditing(_ sender: UITextField) {
        startingScore.text = ""
    }
    // MARK: - Create New Player
    
    @IBAction func setColor(_ sender: UIButton) {
        playerColor = sender.backgroundColor!
        
        if let button = colorButton {
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0
        }
        
        sender.layer.borderColor = UIColor.gray.cgColor
        sender.layer.borderWidth = 2.5
        colorButton = sender
    }
    
    
    @IBAction func saveNewPlayer(_ sender: Any) {
        delegate?.didCreatePlayer(Player(name: playerName.text!,
                                         score: Int32(startingScore.text!)!,
                                         color: playerColor))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelNewPlayer(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
