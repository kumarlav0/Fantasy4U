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
//            let indexPathsArray = self.matchesListTableView.indexPathsForVisibleRows
//            for indexPath in indexPathsArray! {
//                let cell = self.matchesListTableView.cellForRow(at: indexPath) as! MatchesCell
//                let match = self.matches[indexPath.row]
//                if match.isLive {
//                    cell.vsLbl.text = FYString.Live.rawValue
//                    cell.vsLbl.textColor = .green
//                } else {
//                    cell.vsLbl.textColor = .white
//                    let now = Date()
//                    let fireDate = match.date
//                    cell.vsLbl.text = TimeFormatter.calculateTime(now, fireDate: fireDate)
//                }
//
//            }
        }
    }

    func setUpUI() {
        let nib = UINib(nibName: "MatchesCell", bundle: nil)
        matchesListTableView.register(nib, forCellReuseIdentifier: "MatchesCell")
        matchesListTableView.tableFooterView = UIView()
        matchesListTableView.separatorStyle = .none
        matches = DemoData.shared.getTournament().matches
        matchesListTableView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
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

struct TimeFormatter {

    static func secondsInDays(_ seconds: TimeInterval) -> Int {
        return secondsInHours(seconds) / 24
    }

    static func secondsInHours(_ seconds: TimeInterval) -> Int {
        return secondsInMinutes(seconds) / 60
    }

    static func secondsInMinutes(_ seconds: TimeInterval) -> Int {
        return Int(seconds) / 60
    }

    static func secondsInSeconds(_ seconds: TimeInterval) -> Int {
        return Int(seconds) % 60
    }

    static func calculateTime(_ dateCreated: Date, fireDate: Date) -> String {
        let countdownTime = fireDate.timeIntervalSince(dateCreated)
        let days = secondsInDays(countdownTime)
        let hours = secondsInHours(countdownTime) - secondsInDays(countdownTime) * 24
        let minutes = secondsInMinutes(countdownTime) - secondsInHours(countdownTime) * 60
        let seconds = secondsInSeconds(countdownTime)
        var lastString = ""

        if days == 0 {
            lastString = "\(hours):\(minutes):\(seconds) Sec"
        } else if days == 1 {
            lastString = "\(days) Day left"
        } else if days < 4 {
            lastString = "\(days) Day's left"
        } else if days > 3 {
            lastString = getString(date: fireDate)
        }
        return lastString
    }
}
