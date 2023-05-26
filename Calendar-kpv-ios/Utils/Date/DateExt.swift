//
//  DateExt.swift
//  Calendar-kpv-ios
//
//  Created by Роман Ломтев on 26.05.2023.
//

import Foundation

extension Date {
    
    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
            let days1 = calendar.component(component, from: self)
            let days2 = calendar.component(component, from: date)
            return days1 - days2
        }
    
    func isSameDay(_ other: Date) -> Bool {
        return distance(from: other, only: .day) == 0
        && distance(from: other, only: .month) == 0
        && distance(from: other, only: .year) == 0
    }
}
