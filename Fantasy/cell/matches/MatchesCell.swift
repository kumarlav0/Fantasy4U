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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftImageView.layer.cornerRadius = leftImageView.frame.height / 2
        leftImageView.clipsToBounds = true

        rightImageView.layer.cornerRadius = rightImageView.frame.height / 2
        rightImageView.clipsToBounds = true

        vsLbl.layer.cornerRadius = vsLbl.frame.height / 2
        vsLbl.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
