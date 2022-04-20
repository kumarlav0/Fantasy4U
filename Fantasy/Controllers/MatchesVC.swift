//
//  MatchesVC.swift
//  Fantasy
//
//  Created by mac on 16/11/21.
//

import UIKit

class MatchesVC: UIViewController {

    @IBOutlet weak var matchesListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MatchesCell", bundle: nil)
        matchesListTableView.register(nib, forCellReuseIdentifier: "MatchesCell")
        matchesListTableView.tableFooterView = UIView()
        matchesListTableView.separatorStyle = .none
    }

}

extension MatchesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchesListTableView.dequeueReusableCell(withIdentifier: "MatchesCell", for: indexPath) as! MatchesCell
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MatchDetailsVC") as! MatchDetailsVC
        navigationController?.pushViewController(matchDetailsVC, animated: true)
    }
}
