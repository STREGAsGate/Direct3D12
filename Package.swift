// swift-tools-version:5.3

import PackageDescription

//TODO: Change swift version to the correct version when released
//TODO: Remove all of WinSDK, and replace all references with WinSDK.D3D12

#if os(Windows) && swift(>=5.4)
let package = Package(
    name: "Direct3D12",
    products: [
        .library(
            name: "Direct3D12",
            targets: ["Direct3D12"]),
    ],
    dependencies: [
        .package(name: "SwiftCOM", url: "https://github.com/compnerd/swift-com.git", .branch("master")),
        .package(name: "Direct3D12_Enumerations", path: "Sources/Direct3D12_Enumerations"),
    ],
    targets: [
        .target(
            name: "Direct3D12",
            dependencies: ["SwiftCOM", "Direct3D12_Enumerations"],
            swiftSettings: [
                .define("Direct3D12ExcludeOriginalStyleAPI", .when(configuration: .release)),
                .unsafeFlags(["-parse-as-library"]),
            ],
            linkerSettings: [
                .linkedLibrary("User32"),
                .linkedLibrary("Ole32"),
            ]),
    ]
)
#else
#if !os(Windows)
#warning("Direct3D12 is only available on the Windows platform.")
#endif

#if !swift(>=5.4)
#warning("Direct3D12 requires Swift 5.4 or later.")
#endif

let package = Package(name: "Direct3D12")
#endif