//
//  GenerateMockData.swift
//  Fantasy
//
//  Created by Kumar Lav on 21/04/22.
//

import Foundation

class MockData {

    static var shared: MockData = MockData()
    private init() { }

    func getTournament() -> Tournament {
        Tournament(startDate: getDate(strDate: "1/04/2022, 4:30 PM"), EndDate: getDate(strDate: "30/04/2022, 4:30 PM"), matches: getMatches(numberOfMatches: 25), headOfTournament: "SSN Vinay Murti", poweredBy: "Vimal Pan Masala")
    }


    func getMatches(numberOfMatches: Int) -> [Matche] {
        var matches = [Matche]()
        for i in 0..<numberOfMatches {
            matches.append(Matche(teamA: getTeam(), teamB: getTeam(), date: getDate(strDate: "\(1+i)/04/2022, 4:30 PM"), winnerTeam: getTeam(), stadium: getStadium()))
        }
        return matches
    }


    func getTeam() -> Team {
        Team(name: "India", logo: #imageLiteral(resourceName: "Bruno-Fernandes"), score: 0, captain: getPlayer(by: .Wicket_Keeper, playerType: .captain), players: getPlayers())
    }

    func getStadium() -> Stadium {
        Stadium(name: "Holkar", image: #imageLiteral(resourceName: "Bruno-Fernandes"), location: Location(country: "", state: "", city: "Indore", zipCode: 452010))
    }

    func getPlayers(number: Int = 11) -> [Player] {
        var players =  [Player]()
        for _ in 0..<number {
            players.append(getPlayer())
        }
        return players
    }

    func getPlayer(by playerRole: PlayerRole = .All_Rounder, playerType: PlayerType = .normal) -> Player {
        Player(name: "MS Dhoni", image: #imageLiteral(resourceName: "Bruno-Fernandes"), isCaptain: playerType == .captain, role: playerRole)
    }

}







































func getDate(strDate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a" // 12 Match 2022, 4:30 PM
    let date = dateFormatter.date(from: strDate)
    return date ?? Date()
}

/**

 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS


 */
