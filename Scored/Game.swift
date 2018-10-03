//
//  Game.swift
//  Scored
//
//  Created by Lizzie Turner on 10/2/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import Foundation
import UIKit

class Game {
    var name: String
    var id: String = UUID().uuidString
    var players: [Player] = []
    
    init(name: String) {
        self.name = name
    }
}
