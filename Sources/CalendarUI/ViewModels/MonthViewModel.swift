//  Created by William Vabrinskas on 9/29/21.
//

import Foundation
import SwiftUI
import UIKit

public struct MonthViewModel {
  public var model: MonthModel
  public var font: Font
  public var linePadding: CGFloat
  public var titleSize: Double
  public var selectedYear: Int
  public var selectedDay: Int
  public var showMonthTitle: Bool
  
  public init(model: MonthModel = .init(name: "January", number: 1),
              font: Font = .system(.body),
              linePadding: CGFloat = 4,
              titleSize: Double = 16,
              selectedYear: Int,
              selectedDay: Int,
              showMonthTitle: Bool = false) {
    self.model = model
    self.font = font
    self.linePadding = linePadding
    self.titleSize = titleSize
    self.selectedYear = selectedYear
    self.selectedDay = selectedDay
    self.showMonthTitle = showMonthTitle
  }
  
  public static func mock() -> MonthViewModel {
    let model = Self.getMonthModel(month: 1, year: 2022)
    return MonthViewModel(model: model,
                          selectedYear: 2022,
                          selectedDay: 10,
                          showMonthTitle: true)
  }
  
  private static func getMonthModel(month: Int, year: Int) ->  MonthModel {
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
