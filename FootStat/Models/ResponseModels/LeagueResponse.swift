//
//  LeagueResponse.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 07.08.2022.
//

import Foundation

struct LeagueResponse: Decodable {
    var responseStatus: Bool?
    var leagues: [League] = []
    
    private enum CodingKeys: String, CodingKey {
        case responseStatus = "status"
        case leagues = "data"
    }

    init(from decoder: Decoder) throws {
        if let leagueResponseContainer = try? decoder.container(keyedBy: CodingKeys.self) {
            self.responseStatus = try leagueResponseContainer.decode(Bool.self, forKey: .responseStatus)
            self.leagues = try leagueResponseContainer.decode([League].self, forKey: .leagues)
        }
    }
}

struct Logo: Codable {
    let light: String
    let dark: String
}
