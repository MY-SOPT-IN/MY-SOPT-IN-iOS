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
    
    static func pdummy(current: [Dates] = dummy()) -> [Dates] {
        var date = [Dates]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd-e"    //e는 1~7(sun~sat)
        formatter.locale = Locale(identifier: "ko")

        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [Dates]() }
        
        var startDay = myDate.addingTimeInterval( -(86400 * 7))

        for _ in 0...6 {
            let startDayString = formatter.string(from: startDay).components(separatedBy: "-")
            guard let y = Int(startDayString[0]), let m = Int(startDayString[1]), let d = Int(startDayString[2]) else { break }
            startDay = startDay.addingTimeInterval(86400)

            date.append(Dates(dateComponents: DateComponents(year: y, month: m, day: d)))
        }
        
        return date
    }
    
    static func dummy() -> [Dates] {
        var date = [Dates]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd-e"    //e는 1~7(sun~sat)
        formatter.locale = Locale(identifier: "ko")

        let today = Date()
        let todayString = formatter.string(from: today).components(separatedBy: "-") // [0] = YYYY, [1] = MM, [2] = dd, [3] = e
        
        guard let interval = Double(todayString[3]) else{ return [Dates]() }
        var startDay = today.addingTimeInterval( -(86400 * ((interval + 7 - 2).truncatingRemainder(dividingBy: 7))))
        
        for _ in 0...6 {
            let startDayString = formatter.string(from: startDay).components(separatedBy: "-")
            guard let y = Int(startDayString[0]), let m = Int(startDayString[1]), let d = Int(startDayString[2]) else { break }
            startDay = startDay.addingTimeInterval(86400)
            
            date.append(Dates(dateComponents: DateComponents(year: y, month: m, day: d)))
        }
        
        return date
    }
    
    static func ndummy(current: [Dates] = dummy()) -> [Dates] {
        var date = [Dates]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd-e"    //e는 1~7(sun~sat)
        formatter.locale = Locale(identifier: "ko")

        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [Dates]() }
        
        var startDay = myDate.addingTimeInterval(86400 * 7)

        for _ in 0...6 {
            let startDayString = formatter.string(from: startDay).components(separatedBy: "-")
            guard let y = Int(startDayString[0]), let m = Int(startDayString[1]), let d = Int(startDayString[2]) else { break }
            startDay = startDay.addingTimeInterval(86400)

            date.append(Dates(dateComponents: DateComponents(year: y, month: m, day: d)))
        }
        
        return date
    }
    
}
