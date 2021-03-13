// swift-tools-version:5.4

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
        .package(name: "Direct3D12_Enumerations", path: "Sources/Direct3D12_Enumerations"),
    ],
    targets: [
        .target(
            name: "Direct3D12",
            dependencies: ["Direct3D12_Enumerations"],
            swiftSettings: [
                .define("Direct3D12ExcludeOriginalStyleAPI", .when(configuration: .release)),
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