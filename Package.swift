// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-Haptics",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(name: "Haptics", targets: ["Haptics"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Haptics", dependencies: []),
    ]
)
