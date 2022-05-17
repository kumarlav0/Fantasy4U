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
        if match.isLive {
            vsLbl.text = "LIVE"
            vsLbl.textColor = .green
        } else {
            startDate = match.date
            //vsLbl.text = "\(getString(date: match.date))"
            startTimerWithTotalRemainingTime()
            vsLbl.textColor = .white
        }

    }
    
}

extension MatchesCell {

    func startTimerWithTotalRemainingTime() {
        //updateTimer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: Date(), to: startDate)

        vsLbl.text = "\(diffComponents.hour ?? 0):\(diffComponents.minute ?? 0):\(diffComponents.second ?? 0) Second's"
    }
}
