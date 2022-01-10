//
//  File.swift
//  
//
//  Created by William Vabrinskas on 1/9/22.
//

import Foundation

/// Optional helper for building `MonthModel`s
public protocol MonthBuilder {
  
  /// Builds a `MonthModel` with the given month and year
  /// - Returns: A `MonthModel` from the given month and year
  func getMonthModel(month: Int, year: Int) ->  MonthModel
}

public extension MonthBuilder {
  func getMonthModel(month: Int, year: Int) ->  MonthModel {
    let dateUtility = DateUtility()
    let calendar = dateUtility.calendar
    let count = dateUtility.numberOfDays(in: month, for: year)
    
    var days: [DayModel] = []
    
    for i in 1...count {
      let date =  DateComponents(calendar: calendar, year: year, month: month, day: i)
      if let newDate = calendar.date(from: date) {
        let components = calendar.dateComponents([.day, .weekday], from: newDate)

        if let day = components.day,
           let week = components.weekday,
           let dayWord = Day(rawValue: week - 1) {
          let model = DayModel(number: day, dayOfWeek: dayWord)
          days.append(model)
        }

      }
    }
    
    let monthName = Month(rawValue: month - 1) ?? .january
    return MonthModel(name: monthName.title, number: monthName.rawValue + 1, days: days)
  }
}
