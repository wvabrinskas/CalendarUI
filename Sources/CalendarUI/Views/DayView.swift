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

struct DayView: View {
  var viewModel: DayViewModel
  var didSelect: (_ value: Int) -> ()
  
  var body: some View {
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


struct DayView_Previews: PreviewProvider {
  static var previews: some View {
    DayView(viewModel: DayViewModel(isSelected: true),
            didSelect: { _ in })
  }
}
 
