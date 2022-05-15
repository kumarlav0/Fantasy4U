//
//  MatchesCell.swift
//  Fantasy
//
//  Created by Kumar Lav on 16/11/21.
//

import UIKit

class MatchesCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var vsLbl: UILabel!
    @IBOutlet weak var tournamentNameLbl: UILabel!
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftImageView.round()
        rightImageView.round()
        bgView.setShadow()
        vsLbl.round()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
