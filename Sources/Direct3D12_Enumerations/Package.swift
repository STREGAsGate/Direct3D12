// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Direct3D12_Enumerations",
    products: [
        .library(
            name: "Direct3D12_Enumerations",
            targets: ["Direct3D12_Enumerations"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Direct3D12_Enumerations",
            exclude: ["d3d12_h/Enumerations/TEMPLATE_D3D12_ENUM.swift",
                      "d3d12_h/Enumerations/TEMPLATE_D3D12_FLAGS.swift"],
            swiftSettings: [
                .define("Direct3D12ExcludeOriginalStyleAPI", .when(configuration: .release)),
            ]
        ),
    ]
)
