//
//  MatchesVC.swift
//  Fantasy
//
//  Created by Kumar Lav on 16/11/21.
//

import UIKit

class MatchesVC: UIViewController {

    @IBOutlet weak var matchesListTableView: UITableView!

    var matches = [Matche]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MatchesCell", bundle: nil)
        matchesListTableView.register(nib, forCellReuseIdentifier: "MatchesCell")
        matchesListTableView.tableFooterView = UIView()
        matchesListTableView.separatorStyle = .none
        matches = DemoData.shared.getTournament().matches
        matchesListTableView.reloadData()
    }

}

extension MatchesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < matches.count  else {
            print("The index is out of range.")
            return UITableViewCell()
        }

        guard let cell = matchesListTableView.dequeueReusableCell(withIdentifier: "MatchesCell", for: indexPath) as? MatchesCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setData(match: matches[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MatchDetailsVC") as! MatchDetailsVC
        navigationController?.pushViewController(matchDetailsVC, animated: true)
    }
}
