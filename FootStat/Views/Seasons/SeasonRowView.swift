//
//  SeasonRowView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 09.08.2022.
//

import SwiftUI

struct SeasonRowView: View {
    
    let season: Season
    private let isShowStages: Bool
    
    init(_ season: Season) {
        self.season = season
        if season.types.count > 1 {
            self.isShowStages = true
        } else {
            self.isShowStages = false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            seasonView
            stageView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension SeasonRowView {
    @ViewBuilder var stageView: some View {
        if isShowStages {
            VStack(alignment: .leading) {
                ForEach(season.types) { stage in
                    Text(stage.name)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Text("From \(Date(stringDate: stage.startDate).asShortDateString()) to \(Date(stringDate: stage.endDate).asShortDateString())")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
        }
    }
    
    var seasonView: some View {
        VStack(alignment: .leading) {
            Text(season.displayName)
                .font(.headline)
            Text("From \(Date(stringDate: season.startDate).asShortDateString()) to \(Date(stringDate: season.endDate).asShortDateString())")
                .foregroundColor(.secondary)
                .font(.body)
        }
    }
}
