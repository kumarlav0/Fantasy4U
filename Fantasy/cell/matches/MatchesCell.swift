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
    @IBOutlet weak var teamANameLbl: UILabel!
    @IBOutlet weak var teamBNameLbl: UILabel!
    var timer: Timer?
    var startDate: Date!

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

    func setData(match: Matche) {
        leftImageView.image = match.teamA.logo
        rightImageView.image = match.teamB.logo
        tournamentNameLbl.text = "Champaran Cricket League"
        teamANameLbl.text = match.teamA.name
        teamBNameLbl.text = match.teamB.name
        if match.isLive {
            vsLbl.text = FYString.Live.rawValue
            vsLbl.textColor = .green
        } else {
            vsLbl.textColor = .white
            let now = Date()
            let fireDate = match.date
            vsLbl.text = TimeFormatter.calculateTime(now, fireDate: fireDate)
        }
    }
    
}
