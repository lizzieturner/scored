//
//  PlayerTableViewCell.swift
//  Scored
//
//  Created by Lizzie Turner on 10/1/18.
//  Copyright © 2018 lizzieturner. All rights reserved.
//

import UIKit

protocol PlayerCellDelegate {
    func didUpdateScore()
}

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var player: Player? {
        didSet {
            nameLabel.text = player?.name
            scoreLabel.text = "\(player?.score ?? 0)"
            scoreStepper.value = Double(player?.score ?? 0)
            self.contentView.backgroundColor = player?.color
        }
    }
    
    var delegate: PlayerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func updateScore(_ sender: UIStepper) {
        // should use separate buttons, stepper does not store score data correctly
        player?.score = Int32(sender.value)
        delegate?.didUpdateScore()
    }
}
