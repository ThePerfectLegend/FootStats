//
//  StandingRowView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 10.08.2022.
//

import SwiftUI

struct StandingRowView: View {
    
    let standing: Standing
    private let statDataKeys = ["gamesPlayed", "wins", "ties", "losses", "points"]
    private let placeholderColors: [Color] = [.red, .green, .yellow, .blue, .cyan, .purple, .indigo, .mint]

    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(findData(for: "rank"))
                    .font(.callout)
                    .frame(width: 25, height: 25)
                    .background(championsLeagueMark())
                    .mask(RoundedRectangle(cornerRadius: 4))
                teamLogoView
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading) {
                    Text(standing.team.shortDisplayName)
                        .font(.callout)
                        .fontWeight(.medium)
                    Text(standing.team.abbreviation ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer(minLength: 4)
                HStack(spacing: 0) {
                    ForEach(statDataKeys, id: \.self) { dataKey in
                        Text(findData(for: dataKey))
                            .frame(width: 25)
                    }
                }
                .font(.callout)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

extension StandingRowView {
    @ViewBuilder var teamLogoView: some View {
        if let unwrappedLogoArray = standing.team.logos {
            DownloadingImageView(url: unwrappedLogoArray[0].href)
        } else {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .foregroundColor(placeholderColors.randomElement())
        }
    }
    
    func championsLeagueMark() -> Color {
        if let unwrappedColor = standing.note?.color {
            return Color(hex: unwrappedColor.lowercased())
        } else {
            return .clear
        }
    }
    
    func findData(for serching: String) -> String {
        let value = standing.stats.first { stat in
            stat.name.rawValue == serching
        }
        if let unwrappedValue = value {
            return unwrappedValue.displayValue
        } else {
            return ""
        }
    }
}

