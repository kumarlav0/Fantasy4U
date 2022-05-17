//
//  MockData.swift
//  Fantasy
//
//  Created by mac on 16/05/22.
//

import UIKit

class DemoData {
    private init() { }
    static let shared = DemoData()

    func getTournament() -> Tournament {

        let date1 = getDate(strDate: "17/05/2022, 12:02 AM")
        let date2 = getDate(strDate: "17/05/2022, 4:30 AM")
        let date3 = getDate(strDate: "17/05/2022, 8:30 AM")
        let date4 = getDate(strDate: "17/05/2022, 10:30 AM")
        let date5 = getDate(strDate: "12/06/2022, 12:30 PM")
        let date6 = getDate(strDate: "20/06/2022, 4:30 PM")


        let teamA = Team(name: "IND", logo: #imageLiteral(resourceName: "Bruno-Fernandes"), score: 6, captain: nil, players: nil)
        let temaB = Team(name: "ENG", logo: #imageLiteral(resourceName: "josh-king"), score: 7, captain: nil, players: nil)

        let teamAA = Team(name: "PAK", logo: #imageLiteral(resourceName: "5492"), score: 6, captain: nil, players: nil)
        let temaBB = Team(name: "BAN", logo: #imageLiteral(resourceName: "splash screen"), score: 7, captain: nil, players: nil)

        let teamAAA = Team(name: "NEW", logo: #imageLiteral(resourceName: "josh-king"), score: 6, captain: nil, players: nil)
        let temaBBB = Team(name: "SRI", logo: #imageLiteral(resourceName: "splash screen"), score: 7, captain: nil, players: nil)

        let team1 = Team(name: "SAF", logo: #imageLiteral(resourceName: "Bruno-Fernandes"), score: 6, captain: nil, players: nil)
        let tema2 = Team(name: "AFG", logo: #imageLiteral(resourceName: "josh-king"), score: 7, captain: nil, players: nil)

        let team11 = Team(name: "WES", logo: #imageLiteral(resourceName: "5492"), score: 6, captain: nil, players: nil)
        let tema22 = Team(name: "BAN", logo: #imageLiteral(resourceName: "splash screen"), score: 7, captain: nil, players: nil)

        let team111 = Team(name: "IND", logo: #imageLiteral(resourceName: "josh-king"), score: 6, captain: nil, players: nil)
        let team222 = Team(name: "SRI", logo: #imageLiteral(resourceName: "splash screen"), score: 7, captain: nil, players: nil)


        let match1 = Matche(teamA: teamAA, teamB: temaBB, date: date1, winnerTeam: nil, stadium: nil)
        let match2 = Matche(teamA: teamAAA, teamB: temaBBB, date: date2, winnerTeam: nil, stadium: nil)
        let match3 = Matche(teamA: teamA, teamB: temaB, date: date3, winnerTeam: nil, stadium: nil)

        let match4 = Matche(teamA: team1, teamB: tema2, date: date4, winnerTeam: nil, stadium: nil)
        let match5 = Matche(teamA: team11, teamB: tema22, date: date5, winnerTeam: nil, stadium: nil)
        let match6 = Matche(teamA: team111, teamB: team222, date: date6, winnerTeam: nil, stadium: nil)

        let match = [match1, match2, match3, match4, match5, match6]


        return Tournament(startDate: Date(), EndDate: Date(), matches: match, headOfTournament: "", poweredBy: "")
    }
}
