//
//  MatchDetailsVC.swift
//  Fantasy
//
//  Created by Kumar Lav on 16/11/21.
//

import UIKit


class MatchDetailsVC: UIViewController { // leader board

    @IBOutlet weak var scoreListTableView: UITableView!
    @IBOutlet weak var vsLbl: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreListTableView.separatorStyle = .none
        scoreListTableView.registerCellNib(MatchScoreCell.self)
        scoreListTableView.registerHeaderFooterViewNib(ScoreHeaderView.self)
    }
    

   

}

extension MatchDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scoreListTableView.dequeueReusableCell(withIdentifier: "MatchScoreCell", for: indexPath) as! MatchScoreCell
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String.className(ScoreHeaderView.self)) as? ScoreHeaderView else {
            return UIView()
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        5
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView()
        viewFooter.backgroundColor = .red
        return viewFooter
    }


}
