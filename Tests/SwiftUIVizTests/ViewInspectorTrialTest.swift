//
//  ViewInspectorTrialTest.swift
//
//  Created by Joseph Heck on 3/6/20.
//

import SwiftUI
@testable import SwiftUIViz
import ViewInspector
import XCTest

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}

extension ContentView: Inspectable {}
// reference to using ViewInspector to poke around:
// https://github.com/nalexn/ViewInspector/blob/master/guide.md

final class ContentViewTests: XCTestCase {
    func testStringValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "Hello, world!")
    }
}
