//
//  Player.swift
//  Scored
//
//  Created by Lizzie Turner on 10/1/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import Foundation
import UIKit

class Player {
    var name: String
    var score: Int32
    var color: UIColor
    
    init(name: String, score: Int32, color: UIColor) {
        self.name = name
        self.score = score
        self.color = color
    }
}
