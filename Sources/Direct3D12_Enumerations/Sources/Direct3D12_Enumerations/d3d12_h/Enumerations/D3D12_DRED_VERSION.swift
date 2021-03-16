/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify a version of Device Removed Extended Data (DRED), as used by the [D3D12_VERSIONED_DEVICE_REMOVED_EXTENDED_DATA structure](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_device_removed_extended_data).
public enum DredVersion {
    ///	Specifies DRED version 1.0.
    case v1_0
    ///	Specifies DRED version 1.1.
    case v1_1
    ///	Specifies DRED version 1.2.
    case v1_2

    internal var rawValue: WinSDK.D3D12_DRED_VERSION {
        switch self {
            case .v1_0:
                return WinSDK.D3D12_DRED_VERSION_1_0
            case .v1_1:
                return WinSDK.D3D12_DRED_VERSION_1_1
            case .v1_2:
                return WinSDK.D3D12_DRED_VERSION_1_2
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DredVersion")
public typealias D3D12_DRED_VERSION = DredVersion

public extension DredVersion {
    @available(*, deprecated, renamed: "v1_0")
    static let D3D12_DRED_VERSION_1_0 = Self.v1_0

    @available(*, deprecated, renamed: "v1_1")
    static let D3D12_DRED_VERSION_1_1 = Self.v1_1

    @available(*, deprecated, renamed: "v1_2")
    static let D3D12_DRED_VERSION_1_2 = Self.v1_2
}

#endif
