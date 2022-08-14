//
//  Football.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 07.08.2022.
//

import Foundation



struct League: Codable, Identifiable {
    let id: String
    let name: String
    let abbr: String
    let logos: Logo
    var responseStatus: Bool?
    var seasons: [Season]?
}
