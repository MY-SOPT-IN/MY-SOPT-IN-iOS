//
//  Date.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

struct Date {
    let dateComponents: DateComponents
    var color: UIColor = .Semantic.semantic_orange
}

extension Date {
    static func dummy() -> [Date] {
        var date: [Date] = [Date(dateComponents: DateComponents(year: 2023, month: 5, day: 15)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 16)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 17)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 18)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 19)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 20)),
                            Date(dateComponents: DateComponents(year: 2023, month: 5, day: 21))]
        return date
    }
}
