//
//  VerticalAxisView.swift
//
//
//  Created by Joseph Heck on 2/12/20.
//  Copyright © 2020 JFH Consulting. All rights reserved.
//

import SwiftUI
import SwiftViz

public struct VerticalAxisView<ScaleType: TickScale>: View where ScaleType.InputType == Double, ScaleType.OutputType == Float {
    let topInset: CGFloat
    let bottomInset: CGFloat
    let leftOffset: CGFloat
    let tickLength: CGFloat

    var scale: ScaleType
    init(scale: ScaleType, topInset: CGFloat = 25, bottomInset: CGFloat = 25) {
        self.topInset = topInset
        self.bottomInset = bottomInset
        self.scale = scale
        leftOffset = 30
        tickLength = 5
    }

    func tickList<InputType, OutputType>(geometry: GeometryProxy) -> [Tick<InputType, OutputType>] where ScaleType.InputType == InputType, ScaleType.OutputType == OutputType {
        // protect against Preview sending in stupid values
        // of geometry that can't be made into a reasonable range
        // otherwise the next line will crash preview...
        if geometry.size.width < topInset + bottomInset {
            return [Tick<InputType, OutputType>]()
        }
        let upperBound = Float(geometry.size.height - topInset - bottomInset)
        return scale.ticks(rangeLower: 0, rangeHigher: upperBound)
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    // guard against too small:
                    if geometry.size.height < self.topInset + self.bottomInset {
                        return
                    }

                    path.move(to: CGPoint(x: self.leftOffset + self.tickLength, y: self.topInset))
                    path.addLine(to: CGPoint(x: self.leftOffset + self.tickLength, y: geometry.size.height - self.bottomInset))

                    for tick in self.tickList(geometry: geometry) {
                        path.move(to: CGPoint(x: self.leftOffset, y: CGFloat(tick.rangeLocation) + self.topInset))
                        path.addLine(to: CGPoint(x: self.leftOffset + self.tickLength, y: CGFloat(tick.rangeLocation) + self.topInset))
                    }
                }.stroke()
//                ForEach(self.tickList(geometry: geometry)) { tickStruct in
//                    Text(tickStruct.stringValue).position(x: 15, y: tickStruct.rangeLocation + self.topInset)
//                }
            }
        }
    }
}

struct VerticalAxisView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VerticalAxisView(scale: LinearScale.create(0 ... 1.0))
                .frame(width: 100, height: 400, alignment: .center)

            VerticalAxisView(scale: LogScale.DoubleScale(from: 0, to: 10, transform: .none))
                .frame(width: 100, height: 400, alignment: .center)
        }
    }
}
