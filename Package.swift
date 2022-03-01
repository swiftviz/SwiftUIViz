// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftUIViz",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v11),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftUIViz",
            targets: ["SwiftUIViz"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/swiftviz/SwiftViz", from: "0.0.0"),
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftUIViz",
            dependencies: ["SwiftViz"]
        ),
        .testTarget(
            name: "SwiftUIVizTests",
            dependencies: ["SwiftUIViz", "SwiftViz", "ViewInspector"]
        ),
    ]
)
