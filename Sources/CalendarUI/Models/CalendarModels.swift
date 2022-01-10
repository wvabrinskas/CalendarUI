
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

public struct YearModel {
  public var months: [MonthModel] = []
}

public struct MonthModel {
  public var name: String
  public var number: Int
  public var days: [DayModel] = []
}

public struct DayModel {
  public var number: Int
  public var dayOfWeek: Day
}
