// swift-tools-version:5.4
/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import PackageDescription

#if os(Windows)
let package = Package(
    name: "Direct3D12",
    products: [
        .library(
            name: "Direct3D12",
            targets: ["Direct3D12"]),
    ],
    dependencies: [
        .package(name: "Direct3D12_Enumerations", path: "./Sources/Direct3D12_Enumerations"),
    ],
    targets: [
        .target(
            name: "Direct3D12",
            dependencies: ["Direct3D12_Enumerations"],
            swiftSettings: [
                .define("Direct3D12ExcludeOriginalStyleAPI", .when(configuration: .release)),
            ],
            linkerSettings: [
                .linkedLibrary("User32"),
                .linkedLibrary("Ole32"),
            ]
        ),
    ]
)
#else
#if !os(Windows)
#warning("Direct3D12 is only available on the Windows platform.")
#endif

let package = Package(name: "Direct3D12")
#endif