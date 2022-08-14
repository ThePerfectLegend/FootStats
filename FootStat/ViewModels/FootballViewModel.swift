//
//  FootballViewModel.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 07.08.2022.
//

import Foundation

@MainActor class FootballViewModel: ObservableObject {
    
    @Published var leagues: [League] = []
    private let networkManager = NetworkManager.instance
    
    init() {
        Task {
            try await loadLeagues()
        }
    }
    
    private func loadLeagues() async throws {
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues") else {
            throw URLError(.badURL)
        }
        guard let leaguesData = try? await networkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        guard let leagues = try? JSONDecoder().decode(LeagueResponse.self, from: leaguesData) else {
            throw URLError(.cannotParseResponse)
        }
        self.leagues = leagues.leagues
    }
        
    func loadSeasons(forLeague id: String) async throws {
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues/\(id)/seasons") else {
            throw URLError(.badURL)
        }
        guard let seasonData = try? await networkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        guard let seasons = try? JSONDecoder().decode(SeasonResponse.self, from: seasonData) else {
            throw URLError(.cannotDecodeContentData)
        }
        if let responsedLeagueIndex = leagues.firstIndex(where: { $0.id == id }),
           let unwrappedSeasons = seasons.data?.seasons {
            leagues[responsedLeagueIndex].responseStatus = seasons.status
            leagues[responsedLeagueIndex].seasons = unwrappedSeasons
        } else {
            throw URLError(.cannotWriteToFile)
        }
    }
    
    func loadStandings(forLeague id: String, year: Int, completion: (([Standing]) -> Void)?) async throws {
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues/\(id)/standings?season=\(String(year))&sort=asc") else {
            throw URLError(.badURL)
        }
        guard let standingsData = try? await networkManager.download(url: url) else {
            throw URLError(.badServerResponse)
        }
        guard let standings = try? JSONDecoder().decode(StandingResponse.self, from: standingsData) else {
            throw URLError(.cannotDecodeContentData)
        }
        guard let responsedLeagueIndex = leagues.firstIndex(where: { $0.id == id }) else {
            throw URLError(.cannotCreateFile)
        }
        if let responsedYearIndex = leagues[responsedLeagueIndex].seasons?.firstIndex(where: { $0.year == year }),
           let unwrappedStanding = standings.data?.standings {
            leagues[responsedLeagueIndex].seasons![responsedYearIndex].responseStatus = standings.status
            leagues[responsedLeagueIndex].seasons![responsedYearIndex].standings = unwrappedStanding
            completion?(unwrappedStanding)
        }
    }
}
