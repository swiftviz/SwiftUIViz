//
//  File.swift
//
//
//  HorizontalAxisViewTests by Joseph Heck on 3/6/20.
//

import SwiftUI
@testable import SwiftUIViz
import SwiftViz
import ViewInspector
import XCTest

extension HorizontalAxisView: Inspectable {}
// reference to using ViewInspector to poke around:
// https://github.com/nalexn/ViewInspector/blob/master/guide.md

final class HorizontalAxisViewTests: XCTestCase {
    func testHorizontalAxisView_init() throws {
        let exampleView = HorizontalAxisView(scale: LinearScale(domain: 0 ... 5.0, isClamped: false),
                                             leftInset: 25.0,
                                             rightInset: 25.0)
        let path = try exampleView.inspect().geometryReader().zStack().shape(0)
        XCTAssertNotNil(path)

        XCTAssertNotNil(exampleView)
    }
}
