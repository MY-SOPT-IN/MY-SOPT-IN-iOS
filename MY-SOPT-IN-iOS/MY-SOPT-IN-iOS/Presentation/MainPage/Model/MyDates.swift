//
//  Date.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/19.
//

import UIKit

struct MyDates {
    let dateComponents: DateComponents
    var color: UIColor = .Semantic.semantic_orange
}

extension MyDates {
    
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
    
    func getDateRequest() -> String? {
        
        if let y = dateComponents.year, let m = dateComponents.month, let d = dateComponents.day {
            return String(y) + "-" + getStringMonthAndDay(dates: m) + "-" + getStringMonthAndDay(dates: d)
        } else { return "" }
    }
    
    func getStringMonthAndDay(dates: Int) -> String {
        if dates < 10 {
            return "0" + String(dates)
        } else {
            return String(dates)
        }
    }
    static func setFormmatter() -> DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd-e"    //e는 1~7(sun~sat)
        formatter.locale = Locale(identifier: "ko")
        return formatter
    }
    
    static func getToday() -> MyDates? {
        
        let formatter = MyDates.setFormmatter()
        let today = Date()
        
        let todayString = formatter.string(from: today).components(separatedBy: "-")
        guard let y = Int(todayString[0]), let m = Int(todayString[1]), let d = Int(todayString[2]) else { return nil }
        
        return MyDates(dateComponents: DateComponents(year: y, month: m, day: d))
    }
    
    static func dummy() -> [MyDates] {
        
        let formatter: DateFormatter = setFormmatter()

        let today = Date()
        let todayString = formatter.string(from: today).components(separatedBy: "-")
        // [0] = YYYY, [1] = MM, [2] = dd, [3] = e
        
        // 오늘 기준 주의 월요일을 구함
        guard let interval = Double(todayString[3]) else{ return [MyDates]() }
        let monday = today.addingTimeInterval( -(86400 * ((interval + 7 - 2).truncatingRemainder(dividingBy: 7))))

        return getWeeks(monday: monday)
    }
    
    static func getPreviousDateDummy(current: [MyDates] = dummy()) -> [MyDates] {
        
        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [MyDates]() }
        
        let monday = myDate.addingTimeInterval( -(86400 * 7))

        return getWeeks(monday: monday)
    }
    
    static func getNextDateDummy(current: [MyDates] = dummy()) -> [MyDates] {
        
        let myDateComponents = current[0].dateComponents
        let calendar = Calendar.current
        guard let myDate = calendar.date(from: myDateComponents) else { return [MyDates]() }
        
        let monday = myDate.addingTimeInterval(86400 * 7)

        return getWeeks(monday: monday)
    }
    
    static func getWeeks(monday: Date) -> [MyDates] {
        
        var date = [MyDates]()
        
        let formatter = MyDates.setFormmatter()
        var nowDay = monday

        for i in 0...6 {
            let startDayString = formatter.string(from: nowDay).components(separatedBy: "-")
            guard let y = Int(startDayString[0]), let m = Int(startDayString[1]), let d = Int(startDayString[2]) else { break }
            nowDay = nowDay.addingTimeInterval(86400)
            
            if i == 6 {
                date.append(MyDates(dateComponents: DateComponents(year: y, month: m, day: d), color: .Semantic.semantic_red))
            } else {
                date.append(MyDates(dateComponents: DateComponents(year: y, month: m, day: d)))
            }
        }
        return date
    }
}
