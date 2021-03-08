// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WinSDK",
    products: [
        .library(
            name: "WinSDK",
            targets: ["WinSDK"]),
    ],
    targets: [
        .target(name: "WinSDK",
        swiftSettings: [.withUnsafeFlags("-Xswiftc -Xfrontend -Xswiftc -serialize-debugging-options")]),
    ]
)
