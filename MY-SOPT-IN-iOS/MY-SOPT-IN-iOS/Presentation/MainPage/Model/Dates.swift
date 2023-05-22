//
//  Date.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

struct Dates {
    let dateComponents: DateComponents
    let dates: String? = nil
    var color: UIColor = .Semantic.semantic_orange
}

extension Dates {
    
    func weekday(date: DateComponents) -> String? {
        let calendar = Calendar(identifier: .gregorian)
        
        guard let targetDate: Date = {
            let comps = DateComponents(calendar:calendar, year: date.year, month: date.month, day: date.day)
            return comps.date
        }() else { return nil }
        
        let day = Calendar.current.component(.weekday, from: targetDate) - 1
        
        return Calendar.current.veryShortWeekdaySymbols[day]
    }
    
    static func dummy() -> [Dates] {
        var date: [Dates] = [Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 15), color: .Semantic.semantic_red),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 16)),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 17)),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 18)),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 19)),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 20)),
                                Dates(dateComponents: DateComponents(year: 2023, month: 5, day: 21))]
        return date
    }
}
