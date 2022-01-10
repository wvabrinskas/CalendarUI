
//  Created by William Vabrinskas on 9/29/21.
//

import Foundation

public extension Date {
  func getTime(calendar: Calendar = .current) -> (hour: Int, minute: Int) {
    
    let hour = calendar.component(.hour, from: self)
    let minute = calendar.component(.minute, from: self)
    
    return (hour, minute)
  }
}
