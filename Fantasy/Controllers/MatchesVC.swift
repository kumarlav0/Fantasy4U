//
//  MatchesVC.swift
//  Fantasy
//
//  Created by Kumar Lav on 16/11/21.
//

import UIKit
import FSPagerView

class MatchesVC: UIViewController {

    @IBOutlet weak var matchesListTableView: UITableView!


    var matches = [Matche]()
    var updateCellContentsTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
       setUpUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        updateCellContentsTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCells), userInfo: nil, repeats: true)
        updateCells()
    }

    @objc private func updateCells() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.matchesListTableView.reloadData()
        }
    }

    private func setUpUI() {
        let matchNib = UINib(nibName: "MatchesCell", bundle: nil)
        matchesListTableView.register(matchNib, forCellReuseIdentifier: "MatchesCell")
        matchesListTableView.tableFooterView = UIView()
        matchesListTableView.separatorStyle = .none
        matches = DemoData.shared.getTournament().matches
        matchesListTableView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true

        let sliderNib = UINib(nibName: "SliderCell", bundle: nil)
        matchesListTableView.register(sliderNib, forCellReuseIdentifier: "SliderCell")

    }


}

extension MatchesVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = matchesListTableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath) as? SliderCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        } else {
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
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 140 : 121
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchDetailsVC = storyboard?.instantiateViewController(withIdentifier: "MatchDetailsVC") as! MatchDetailsVC
        navigationController?.pushViewController(matchDetailsVC, animated: true)
    }
}
