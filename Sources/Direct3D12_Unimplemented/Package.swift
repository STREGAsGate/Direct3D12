// swift-tools-version:5.4
/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import PackageDescription

let package = Package(
    name: "Direct3D12_Unimplemented",
    products: [
        .library(
            name: "Direct3D12_Unimplemented",
            targets: ["Direct3D12_Unimplemented"]),
    ],
    targets: [
        .target(name: "Direct3D12_Unimplemented"),
    ]
)
