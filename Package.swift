// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//TODO: Change swift version to the correct version when released

#if os(Windows) && swift(>=5.3)
let package = Package(
    name: "Direct3D12",
    products: [
        .library(
            name: "Direct3D12",
            targets: ["Direct3D12"]),
    ],
    dependencies: [
        .package(name: "SwiftCOM", url: "https://github.com/compnerd/swift-com.git", .branch("master")),
    ],
    targets: [
        .systemLibrary(name: "_d3d12"),
        .target(
            name: "Direct3D12",
            dependencies: ["SwiftCOM", "_d3d12"]),
    ]
)
#else
#if !os(Windows)
#warning("Direct3D12 is only available on the Windows platform.")
#endif

#if !swift(>=5.3)
#warning("Direct3D12 requires Swift 5.3.3 or later.")
#endif

let package = Package(name: "Direct3D12")
#endif