// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Utils",
    platforms: [.iOS(.v13), .macOS(.v10_15)], 
    products: [
        .library(
            name: "Utils",
            targets: ["Utils"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Utils",
            dependencies: []),
        .testTarget(
            name: "UtilsTests",
            dependencies: ["Utils"]),
    ]
)

