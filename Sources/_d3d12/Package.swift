// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "_d3d12",
    products: [
        .library(
            name: "_d3d12",
            targets: ["_d3d12"]),
    ],
    targets: [
        .target(name: "_d3d12"),
    ]
)
