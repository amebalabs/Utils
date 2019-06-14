// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Utils",
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

