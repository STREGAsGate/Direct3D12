// swift-tools-version:5.4
/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */


// This package exists only becuase of https://bugs.swift.org/browse/SR-8671
// Since enums don't contain structs or pointers all the enums can safely be segregated to this sub-package, reducing the build command length for each package.
// Once SR-8671 is resolved this package can be folded into the main package.
// Public API meant to be internal (`RawType`, `RawValue`, `rawValue`, etc...) can also be made internal
import PackageDescription

let package = Package(
    name: "Direct3D12_Enumerations",
    products: [
        .library(
            name: "Direct3D12_Enumerations",
            targets: ["Direct3D12_Enumerations"]),
    ],
    targets: [
        .target(name: "Direct3D12_Enumerations"),
    ]
)
