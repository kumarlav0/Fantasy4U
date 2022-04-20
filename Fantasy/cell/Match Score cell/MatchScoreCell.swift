//
//  MatchScoreCell.swift
//  Fantasy
//
//  Created by mac on 16/11/21.
//

import UIKit

class MatchScoreCell: UITableViewCell {
    @IBOutlet weak var playerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        playerImageView.layer.cornerRadius = playerImageView.frame.height / 2
        playerImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
