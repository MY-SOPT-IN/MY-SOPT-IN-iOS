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
    
    func getWeekday(date: DateComponents) -> String? {
        
        guard let targetDate: Date = {
            let comps = DateComponents(calendar: Calendar(identifier: .gregorian),
                                       year: date.year,
                                       month: date.month,
                                       day: date.day)
            return comps.date
        }() else { return nil }
        
        // component가 1~7까지 이루어져 있어 이를 인덱스로 반환하기 위해 -1
        let day = Calendar.current.component(.weekday, from: targetDate) - 1
        return Calendar.current.veryShortWeekdaySymbols[day]
    }
    
    func getDateString() -> String? {
        
        if let y = dateComponents.year, let m = dateComponents.month, let d = dateComponents.day {
            return String(y) + "년 " + String(m) + "월 " + String(d) + "일"
        } else { return "" }
    }
    
    static func setFormmatter() -> DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd-e"    //e는 1~7(sun~sat)
        formatter.locale = Locale(identifier: "ko")
        return formatter
    }
    
    static func getToday() -> Dates? {
        
        let formatter = Dates.setFormmatter()
        let today = Date()
        
        let todayString = formatter.string(from: today).components(separatedBy: "-")
        guard let y = Int(todayString[0]), let m = Int(todayString[1]), let d = Int(todayString[2]) else { return nil }
        
        return Dates(dateComponents: DateComponents(year: y, month: m, day: d))
    }
    
    static func dummy() -> [Dates] {
        
        let formatter: DateFormatter = setFormmatter()

        let today = Date()
        let todayString = formatter.string(from: today).components(separatedBy: "-")
        // [0] = YYYY, [1] = MM, [2] = dd, [3] = e
        
        // 오늘 기준 주의 월요일을 구함
        guard let interval = Double(todayString[3]) else{ return [Dates]() }
        let monday = today.addingTimeInterval( -(86400 * ((interval + 7 - 2).truncatingRemainder(dividingBy: 7))))

        return getWeeks(monday: monday)
    }
    
    static func getPreviousDateDummy(current: [Dates] = dummy()) -> [Dates] {
        
        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [Dates]() }
        
        let monday = myDate.addingTimeInterval( -(86400 * 7))

        return getWeeks(monday: monday)
    }
    
    static func getNextDateDummy(current: [Dates] = dummy()) -> [Dates] {
        
        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [Dates]() }
        
        let monday = myDate.addingTimeInterval(86400 * 7)

        return getWeeks(monday: monday)
    }
    
    static func getWeeks(monday: Date) -> [Dates] {
        
        var date = [Dates]()
        
        let formatter = Dates.setFormmatter()
        var nowDay = monday

        for i in 0...6 {
            let startDayString = formatter.string(from: nowDay).components(separatedBy: "-")
            guard let y = Int(startDayString[0]), let m = Int(startDayString[1]), let d = Int(startDayString[2]) else { break }
            nowDay = nowDay.addingTimeInterval(86400)
            
            if i == 6 {
                date.append(Dates(dateComponents: DateComponents(year: y, month: m, day: d), color: .Semantic.semantic_red))
            } else {
                date.append(Dates(dateComponents: DateComponents(year: y, month: m, day: d)))
            }
        }
        return date
    }
}
