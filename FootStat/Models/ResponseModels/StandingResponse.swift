//
//  StandingResponse.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 09.08.2022.
//

import Foundation

struct StandingResponse: Codable {
    var status: Bool?
    var data: SeasonData?
}

struct SeasonData: Codable {
    let name, seasonDisplay: String
    let abbreviation: String?
    let season: Int
    let standings: [Standing]
}

struct Standing: Codable {
    let team: Team
    let note: Note?
    let stats: [Stat]
}

struct Team: Codable {
    let id, uid, location, name: String
    let abbreviation: String?
    let displayName, shortDisplayName: String
    let logos: [TeamLogo]?
}

struct TeamLogo: Codable {
    let href: String
    let width, height: Int
    let alt: String
}

struct Note: Codable {
    let color, description: String
    let rank: Int
}

struct Stat: Codable {
    let name: Name
    let displayName: Description
    let shortDisplayName: ShortDisplayName
    let description: Description
    let abbreviation: Abbreviation
    let type: TypeEnum
    let value: Int?
    let displayValue: String
    let id, summary: String?
}

enum Abbreviation: String, Codable {
    case a = "A"
    case d = "D"
    case f = "F"
    case gd = "GD"
    case gp = "GP"
    case l = "L"
    case p = "P"
    case pd = "PD"
    case ppg = "PPG"
    case r = "R"
    case rc = "RC"
    case total = "Total"
    case w = "W"
}

enum Description: String, Codable {
    case draws = "Draws"
    case gamesPlayed = "Games Played"
    case goalDifference = "Goal Difference"
    case goalsAgainst = "Goals Against"
    case goalsFor = "Goals For"
    case losses = "Losses"
    case overall = "Overall"
    case overallRecord = "Overall Record"
    case pointDeductions = "Point Deductions"
    case points = "Points"
    case pointsPerGame = "Points Per Game"
    case rank = "Rank"
    case rankChange = "Rank Change"
    case teamSCurrentWinLossRecord = "Team's current Win-Loss record"
    case wins = "Wins"
}

enum Name: String, Codable {
    case allSplits = "All Splits"
    case deductions = "deductions"
    case gamesPlayed = "gamesPlayed"
    case losses = "losses"
    case pointDifferential = "pointDifferential"
    case points = "points"
    case pointsAgainst = "pointsAgainst"
    case pointsFor = "pointsFor"
    case ppg = "ppg"
    case rank = "rank"
    case rankChange = "rankChange"
    case ties = "ties"
    case wins = "wins"
}

enum ShortDisplayName: String, Codable {
    case a = "A"
    case d = "D"
    case deductions = "Deductions"
    case f = "F"
    case gd = "GD"
    case gp = "GP"
    case l = "L"
    case over = "OVER"
    case p = "P"
    case ppg = "PPG"
    case rank = "Rank"
    case rankChange = "Rank Change"
    case w = "W"
}

enum TypeEnum: String, Codable {
    case deductions = "deductions"
    case gamesplayed = "gamesplayed"
    case losses = "losses"
    case pointdifferential = "pointdifferential"
    case points = "points"
    case pointsagainst = "pointsagainst"
    case pointsfor = "pointsfor"
    case ppg = "ppg"
    case rank = "rank"
    case rankchange = "rankchange"
    case ties = "ties"
    case total = "total"
    case wins = "wins"
}

