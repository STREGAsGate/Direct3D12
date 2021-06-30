// swift-tools-version:5.4
/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 *
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import PackageDescription

let package = Package(
    name: "Direct3D12",
    products: [
        .library(name: "Direct3D12", targets: ["Direct3D12"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Direct3D12",
            swiftSettings: [
                .define("Direct3D12ExcludeOriginalStyleAPI", .when(configuration: .release)),
            ],
            linkerSettings: [
                .linkedLibrary("User32"),
                .linkedLibrary("Ole32"),
                .linkedLibrary("PortableDeviceGuids"),
                .linkedLibrary("DXGI"),
                .linkedLibrary("D3D12"),
                .linkedLibrary("D3DCompiler"),
            ]
        ),
    ]
)
