//  Created by William Vabrinskas on 9/22/21.
//

import Foundation

struct Time {
  var hour: Int
  var minute: Int
  var ampm: String
  
  var asString: String {
    let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
    return "\(hour):\(minuteString) \(ampm)"
  }
  
  init(hour: Int, minute: Int) {
    self.minute = minute
    
    var converted = hour > 12 ? hour - 12 : hour
    converted = converted == 0 ? 12 : converted
    self.hour = abs(converted)
    
    self.ampm = Self.getAMPM(hour: hour)
  }
  
  static func getAMPM(hour: Int) -> String {
    let ampmHour = hour - 12  == 0 ? 12 : hour - 12
    let ampm = ampmHour.signum() == 1 ? "pm" : "am"
    return ampm
  }
}

struct TimeSlot {
  var start: Time
  var end: Time
}

struct DateUtility {
  public var calendar: Calendar = .current

  func convertDate(_ date: Date) -> Date {
    let formatter = DateFormatter()
    formatter.calendar = calendar
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    let string = formatter.string(from: date)
    let newDate = formatter.date(from: string) ?? date
    
    return newDate
  }

  static public let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
  }()
  
  public func getDate(day: Int, month: Int, year: Int) -> Date {
    let calendar = calendar

    var startComps = DateComponents()
    startComps.day = day
    startComps.month = month
    startComps.year = year
    startComps.minute = 0
    startComps.hour = 0
    
    let date = calendar.date(from: startComps)
    return date ?? Date()
  }
  
  public func getHours(start: Date, end: Date) -> TimeSlot {
    
    let startTimeRaw = start.getTime(calendar: calendar)
    let endTimeRaw = end.getTime(calendar: calendar)
    
    let startTime = Time(hour: startTimeRaw.hour, minute: startTimeRaw.minute)
    let endTime = Time(hour: endTimeRaw.hour, minute: endTimeRaw.minute)
    
    return TimeSlot(start: startTime, end: endTime)
  }

  public func numberOfDays(in month: Int, for year: Int) -> Int {
    let calendar = calendar
    
    var startComps = DateComponents()
    startComps.day = 1
    startComps.month = month
    startComps.year = year
    
    var endComps = DateComponents()
    endComps.day = 1
    endComps.month = month == 12 ? 1 : month + 1
    endComps.year = month == 12 ? year + 1 : year
    
    guard let startDate = calendar.date(from: startComps),
          let endDate = calendar.date(from:endComps) else {
            return 0
    }
    
    let diff = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
    
    let count = diff.day ?? 0
    return count
  }
  
}
