// swift-tools-version:5.4
/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import PackageDescription

let package = Package(
    name: "Direct3D12_Enumerations",
    products: [
        .library(
            name: "Direct3D12_Enumerations",
            targets: ["Direct3D12_Enumerations"]),
    ],
    targets: [
        .target(
            name: "Direct3D12_Enumerations",
            exclude: ["d3d12_h/Enumerations/TEMPLATE_D3D12_ENUM.swift",
                      "d3d12_h/Enumerations/TEMPLATE_D3D12_FLAGS.swift"]
        ),
    ]
)
