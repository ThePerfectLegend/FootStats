//
//  LoadingView.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 09.08.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            Text("LOADING")
                .foregroundColor(.secondary)
                .font(.caption)
        }
    }
}

