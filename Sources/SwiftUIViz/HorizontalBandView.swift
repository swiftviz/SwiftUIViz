//
//  HorizontalAxisBandView.swift
//
//
//  Created by Joseph Heck on 3/4/20.
//  Copyright © 2020 JFH Consulting. All rights reserved.
//

import SwiftUI
import SwiftViz

public struct HorizontalBandView<ScaleType: TickScale>: View where ScaleType.InputType == Double, ScaleType.OutputType == Float {
    var scale: ScaleType

    init(scale: ScaleType) {
        self.scale = scale
    }

    func tickList<InputType, OutputType>(geometry: GeometryProxy) -> [Tick<InputType, OutputType>] where ScaleType.InputType == InputType, ScaleType.OutputType == OutputType {
        // protect against Preview sending in stupid values
        // of geometry that can't be made into a reasonable range
        // otherwise the next line will crash preview...
        let upperBound = Float(geometry.size.width)
        return scale.ticks(rangeLower: 0.0, rangeHigher: upperBound)
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                // boxes in the view
                Rectangle().fill(Color.white)
                Rectangle().stroke()
                Path { path in
                    // draw each tick in the line
                    for tick in self.tickList(geometry: geometry) {
                        path.move(to: CGPoint(x: CGFloat(tick.rangeLocation), y: 0))
                        path.addLine(to: CGPoint(x: CGFloat(tick.rangeLocation), y: geometry.size.height))
                    }
                }.stroke(lineWidth: 0.5)
            }
//            ForEach(self.tickList(geometry: geometry)) { tickStruct in
//                Text(tickStruct.stringValue).position(x: tickStruct.rangeLocation, y: geometry.size.height / 2)
//            }
        }
    }
}

#if DEBUG
    struct HorizontalBandView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                HorizontalBandView(scale: LinearScale.create(0 ... 5.0))
                    .frame(width: 400, height: 50, alignment: .center)
                    .padding()

                HorizontalBandView(scale: LogScale.DoubleScale(from: 0, to: 10))
                    .frame(width: 400, height: 50, alignment: .center)
                    .padding()

                HorizontalBandView(scale: LogScale.DoubleScale(from: 0.1, to: 100.0))
                    .frame(width: 400, height: 50, alignment: .center)
                    .padding()
            }
        }
    }
#endif
