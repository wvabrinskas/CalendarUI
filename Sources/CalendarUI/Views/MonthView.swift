//
//  
//  MonthView.swift
//  Pland
//
//  Created by William Vabrinskas on 9/29/21.
//
//

import Foundation
import SwiftUI

public struct MonthView: View {
  public var viewModel: MonthViewModel
  public var dayChanged: ((_ day: Int) -> ())? = nil
    
  private var totalDays: Int {
    return viewModel.model.days.count
  }
  
  private var numOfRows: Int {
    var days = viewModel.model.days.count
    days += offset
    let round = Double(days).truncatingRemainder(dividingBy: Double(7))
    return round > 0 ? Int(floor(Double(days) / 7) + 1) : Int(Double(days) / 7)
  }
  
  private var offset: Int {
    var offset = 0
    if let first = viewModel.model.days.first {
      offset = first.dayOfWeek.rawValue
    }
    return offset
  }
  
  public init(viewModel: MonthViewModel,
              dayChanged: ((_ day: Int) -> ())? = nil) {
    self.viewModel = viewModel
    self.dayChanged = dayChanged
  }
  
  public var body: some View {
    VStack {
      if viewModel.showMonthTitle {
        HStack {
          Text(viewModel.model.name)
            .font(self.viewModel.font)
            .padding(.leading, 22)
            .padding(.top, 16)
          Spacer()
          Text("\(self.viewModel.selectedYear)".replacingOccurrences(of: ",", with: ""))
            .font(self.viewModel.font)
            .padding(.top, 16)
            .padding(.trailing, 22)
        }
      }

      HStack {
        ForEach(Day.allCases, id: \.self) { day in
          Spacer()
          Text(day.abbreviation)
            .font(self.viewModel.font)
            .fontWeight(.bold)
          Spacer()
        }
      }
      .padding([.leading, .trailing], 5)
      .padding(.top, viewModel.linePadding)

      VStack(spacing: 0) {
        ForEach(0..<numOfRows, id: \.self) { r in

          HStack {

            ForEach(0..<7, id: \.self) { c in
              HStack {

                Spacer()

                let oneDindex = ((r * 7) + c) - offset;
                if oneDindex >= 0, oneDindex < totalDays {
                  let model = viewModel.model.days[oneDindex]
                  let daySelected = isDaySelected(num: model.number)
                  let vm = DayViewModel(title: "\(model.number)",
                                        number: model.number,
                                        isSelected: daySelected)

                  DayView(viewModel: vm, didSelect: { val in
                    self.dayChanged?(val)
                  })
                } else {
                  EmptyView()
                }

                Spacer()
              }
            }
          }
          .padding([.leading, .trailing], 5)
          .padding(.top, viewModel.linePadding)
        }
        Spacer()
      }
    }
  }

  private func isDaySelected(num: Int) -> Bool {
    return viewModel.selectedDay == num
  }
}


public struct MonthView_Previews: PreviewProvider {
  public static var previews: some View {
    Group {
      MonthView(viewModel: .mock())
      MonthView(viewModel: .mock())
    }
  }
}
