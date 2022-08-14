//
//  LeagueRowView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 04.08.2022.
//

import SwiftUI

struct LeagueRowView: View {
    
    let league: League
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            DownloadingImageView(url: colorScheme == .dark ? league.logos.dark : league.logos.light)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(league.abbr)
                    .font(.headline)
                Text(league.name)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
