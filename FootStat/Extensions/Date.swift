//
//  Date.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 05.08.2022.
//

import Foundation

import Foundation

extension Date {
    
    init(stringDate: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "2021-11-10T14:24:11.849Z"
        let date = formatter.date(from: stringDate) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
