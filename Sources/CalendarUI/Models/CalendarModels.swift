
//  Created by William Vabrinskas on 9/29/21.
//

import Foundation
import SwiftUI

public enum Month: Int, CaseIterable {
  case january,
       february,
       march,
       april,
       may,
       june,
       july,
       august,
       september,
       october,
       november,
       december
  
  public var title: String {
    switch self {
    case .january: return "January"
    case .february: return "February"
    case .march: return "March"
    case .april: return "April"
    case .may: return "May"
    case .june: return "June"
    case .july: return "July"
    case .august: return "August"
    case .september: return "September"
    case .october: return "October"
    case .november: return "November"
    case .december: return "December"
    }
  }
  
  public var abbreviation: String {
    switch self {
    case .january: return "Jan"
    case .february: return "Feb"
    case .march: return "Mar"
    case .april: return "Apr"
    case .may: return "May"
    case .june: return "Jun"
    case .july: return "Jul"
    case .august: return "Aug"
    case .september: return "Sep"
    case .october: return "Oct"
    case .november: return "Nov"
    case .december: return "Dec"
    }
  }
}

public enum Day: Int, CaseIterable {
  case sunday
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  
  public var title: String {
    switch self {
    case .monday: return "Monday"
    case .tuesday: return "Tuesday"
    case .wednesday: return "Wednesday"
    case .thursday: return "Thursday"
    case .friday: return "Friday"
    case .saturday: return "Saturday"
    case .sunday: return "Sunday"
    }
  }
  
  public var abbreviation: String {
    switch self {
    case .monday: return "M"
    case .tuesday: return "T"
    case .wednesday: return "W"
    case .thursday: return "Th"
    case .friday: return "F"
    case .saturday: return "Sa"
    case .sunday: return "Su"
    }
  }
}

/// Model describing a single year
public struct YearModel {
  public var months: [MonthModel]
  
  /// Initializer method
  /// - Parameter months: Array of `MonthModel`s for this year
  public init(months: [MonthModel] = []) {
    self.months = months
  }
}

/// Model describing a single month
public struct MonthModel {
  public var name: String
  public var number: Int
  public var days: [DayModel]
  
  /// Initializer method
  /// - Parameters:
  ///   - name: Name of the month
  ///   - number: Number of the month
  ///   - days: Array of `DayModel`s for the days of the month
  public init(name: String,
              number: Int,
              days: [DayModel] = []) {
    self.name = name
    self.number = number
    self.days = days
  }
}


/// Model describing a single day
public struct DayModel {
  public var number: Int
  public var dayOfWeek: Day
  
  /// Initializer
  /// - Parameters:
  ///   - number: Number of the day
  ///   - dayOfWeek: Day of the week of this particular day
  public init(number: Int, dayOfWeek: Day) {
    self.number = number
    self.dayOfWeek = dayOfWeek
  }
}
