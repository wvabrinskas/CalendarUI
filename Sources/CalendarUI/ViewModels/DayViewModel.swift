//  Created by William Vabrinskas on 10/12/21.
//

import Foundation
import SwiftUI
import UIKit

public struct DayViewModel {
  public var title: String = "0"
  public var font: Font = .system(.body)
  public var number: Int = 1
  public var isSelected: Bool = false
  public var selectedColor: Color = Color(UIColor.systemGray6)
}
