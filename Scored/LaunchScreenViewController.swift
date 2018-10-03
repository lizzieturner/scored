//
//  ViewController.swift
//  Scored
//
//  Created by Lizzie Turner on 9/25/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func createNewGame(_ sender: Any) {
        print("create pressed")
    }
    
    @IBAction func loadExistingGame(_ sender: Any) {
        print("load pressed")
    }
}

