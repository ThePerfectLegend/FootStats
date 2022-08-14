//
//  SeasonsView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 08.08.2022.
//

import SwiftUI

struct SeasonsView: View {
    
    @EnvironmentObject var footballViewModel: FootballViewModel
    
    let league: League
    
    var body: some View {
        ZStack {
            if let unwrappedSeasons = league.seasons {
                List {
                    ForEach(unwrappedSeasons, id: \.year) { season in
                        NavigationLink(destination: StandingView(season: season, league: league) ) {
                            SeasonRowView(season)
                        }
                    }
                }
                .listStyle(.plain)
            } else {
                LoadingView()
            }
        }
        .navigationBarTitle(Text(league.abbr), displayMode: .inline)
        .onAppear {
            Task {
                // не нужно делать вызов если данные уже есть в модели?
                try await footballViewModel.loadSeasons(forLeague: league.id)
            }
        }
    }
}
