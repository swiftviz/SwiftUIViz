//
//  HorizontalBandViewTests.swift
//
//
//  Created by Joseph Heck on 3/6/20.
//

import SwiftUI
@testable import SwiftUIViz
import SwiftViz
import ViewInspector
import XCTest

extension HorizontalBandView: Inspectable {}
// reference to using ViewInspector to poke around:
// https://github.com/nalexn/ViewInspector/blob/master/guide.md

final class HorizontalBandViewTests: XCTestCase {
    func testHorizontalBandView_init() throws {
        let exampleView = HorizontalBandView(scale: LinearScale.create(0 ... 5.0))
        XCTAssertNotNil(exampleView)
    }
}
