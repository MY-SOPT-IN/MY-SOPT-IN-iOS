//
//  Routine.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

struct Routine {
    let whendo: String
    let content: String
    var doTapped: Bool
}

extension Routine {
    static func dummy() -> [Routine] {
        var routine = [Routine]()
        for _ in 0...10 {
            routine.append(Routine(whendo: "루틴 볼때마다", content: "이거보면 목 스트레칭", doTapped: false))
        }
        return routine
    }
}
