//
//  SeasonsModel.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 04.08.2022.
//

import Foundation

struct SeasonResponse: Codable {
    var status: Bool?
    var data: LeagueData?
}

struct LeagueData: Codable {
    let name: String?
    let desc: String
    let abbreviation: String?
    let seasons: [Season]
}

struct Season: Codable {
    let year: Int
    let startDate, endDate, displayName: String
    let types: [Stage]
    var responseStatus: Bool?
    var standings: [Standing]?
}

struct Stage: Codable, Identifiable {
    let id, name, abbreviation, startDate, endDate: String
    let hasStandings: Bool
}
