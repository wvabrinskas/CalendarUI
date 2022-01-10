//  Created by William Vabrinskas on 10/12/21.
//

import Foundation
import SwiftUI
import UIKit

public struct DayViewModel {
  public var title: String
  public var font: Font
  public var number: Int
  public var isSelected: Bool
  public var selectedColor: Color
  
  public init(title: String = "0",
              font: Font = .system(.body),
              number: Int = 1,
              isSelected: Bool = false,
              selectedColor: Color = Color(UIColor.systemGray6)) {
    self.title = title
    self.font = font
    self.number = number
    self.isSelected = isSelected
    self.selectedColor = selectedColor
  }
}
