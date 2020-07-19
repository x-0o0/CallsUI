// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CallsUI",
    platforms: [.iOS("14.0")],
    products: [
        .library(
            name: "CallsUI",
            targets: ["CallsUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swift-at-Night/ElViewKit", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "CallsUI",
            dependencies: ["ElViewKit"]),
        .testTarget(
            name: "CallsUITests",
            dependencies: ["CallsUI"]),
    ]
)
