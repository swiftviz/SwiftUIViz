//
//  VerticalAxisViewTests.swift
//
//
//  Created by Joseph Heck on 3/6/20.
//

import SwiftUI
@testable import SwiftUIViz
import SwiftViz
import ViewInspector
import XCTest

extension VerticalAxisView: Inspectable {}
// reference to using ViewInspector to poke around:
// https://github.com/nalexn/ViewInspector/blob/master/guide.md

final class VerticalAxisViewTests: XCTestCase {
    func testVerticalAxisView_init() throws {
        let exampleView = VerticalAxisView(scale: LinearScale.create(0 ... 5.0))
        XCTAssertNotNil(exampleView)
    }
}
