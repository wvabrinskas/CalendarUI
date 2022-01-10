
//  Created by William Vabrinskas on 9/29/21.
//

import Foundation
import SwiftUI

enum Month: Int, CaseIterable {
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
  
  var title: String {
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
  
  var abbreviation: String {
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

enum Day: Int, CaseIterable {
  case sunday
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  
  var title: String {
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
  
  var abbreviation: String {
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

struct YearModel {
  var months: [MonthModel] = []
}

struct MonthModel {
  var name: String
  var number: Int 
  var days: [DayModel] = []
}

struct DayModel {
  var number: Int
  var dayOfWeek: Day
}
