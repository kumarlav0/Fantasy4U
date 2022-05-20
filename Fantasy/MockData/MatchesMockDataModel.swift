//
//  MatchesMock.swift
//  Fantasy
//
//  Created by Kumar Lav on 20/04/22.
//

import UIKit

struct Tournament {
    var name: String?
    var startDate: Date
    var EndDate: Date
    var matches: [Matche]
    var totalMatches: Int {
        matches.count
    }
    var headOfTournament: String
    var poweredBy: String // Company or organizer name.
}


struct Matche {
    var teamA: Team
    var teamB: Team
    var date: Date
    var winnerTeam: Team? /// Will be teamA or maybe teamB when match is over.
    var stadium: Stadium?
    var tornamentName = "Purnea T20 Cricket League"
}

extension Matche {
    var isLive: Bool {
        date <= Date() /// Write logic here.
    }
}

struct Team {
    var name: String
    var logo: UIImage?
    var score: Int
    var captain: Player?
    var players: [Player]?
}

struct Player {
    var name: String
    var image: UIImage
    var isCaptain: Bool
    var role: PlayerRole
}

struct Stadium {
    var name: String
    var image: UIImage
    var location: Location
    var fullAddress: String { // Holkar Stadium, Indore, MP, 452010, India
        "\(name), \(location.city), \(location.state), \(location.zipCode), \(location.country),"
    }
}

struct Location {
    var country: String
    var state: String
    var city: String
    var zipCode: Double
}

enum PlayerRole {
    case All_Rounder
    case Batsman
    case Wicket_Keeper
    case Bowler
}

enum PlayerType {
    case captain
    case vice_captain
    case normal
}

// cricket team contains four batsmen, three all-rounders, one wicket-keeper and three bowlers.
