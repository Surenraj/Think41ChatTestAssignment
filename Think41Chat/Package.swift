// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Think41Chat",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Think41Chat",
            targets: ["Think41Chat"]
        )
    ],
    targets: [
        .target(
            name: "Think41Chat"
        ),
        .testTarget(
            name: "Think41ChatTests",
            dependencies: ["Think41Chat"]
        )
    ]
)

