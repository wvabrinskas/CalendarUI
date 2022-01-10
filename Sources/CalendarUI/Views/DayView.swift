//
//  
//  DayView.swift
//  Pland
//
//  Created by William Vabrinskas on 10/12/21.
//
//

import Foundation
import SwiftUI

public struct DayView: View {
  public var viewModel: DayViewModel
  public var didSelect: (_ value: Int) -> ()
  
  public init(viewModel: DayViewModel,
              didSelect: @escaping (_ value: Int) -> ()) {
    self.viewModel = viewModel
    self.didSelect = didSelect
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      Text(viewModel.title)
        .font(self.viewModel.font)
    }
    .onTapGesture {
      self.didSelect(self.viewModel.number)
    }
    .padding(6)
    .background(self.viewModel.isSelected ? self.viewModel.selectedColor : .clear)
    .transition(.opacity)
    .animation(.easeInOut(duration: 0.2))
    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
  }
}


public struct DayView_Previews: PreviewProvider {
  public static var previews: some View {
    DayView(viewModel: DayViewModel(isSelected: true),
            didSelect: { _ in })
  }
}
 
