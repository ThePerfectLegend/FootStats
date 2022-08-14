//
//  FootballLeaguesView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 07.08.2022.
//

import SwiftUI

struct LeaguesView: View {
    
    @StateObject var footballViewModel = FootballViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if footballViewModel.leagues.isEmpty {
                    LoadingView()
                } else {
                    List {
                        ForEach(footballViewModel.leagues) { league in
                            NavigationLink(destination: SeasonsView(league: league) ) {
                                LeagueRowView(league: league)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitle(Text("Leagues"), displayMode: .large)
        }
        .navigationViewStyle(.stack) 
        .environmentObject(footballViewModel)
    }
}


