/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import WinSDK.DirectX

/// Specifies the version of root signature layout.
public enum RootSignatureVersion {
    public typealias RawValue = WinSDK.D3D_ROOT_SIGNATURE_VERSION
    /// Version one of root signature layout.
    case v1_0
    ///	Version 1.1 of root signature layout.
    @available(Windows, introduced: 10.0.14393)
    case v1_1

    public var rawValue: RawValue {
        switch self {
            case .v1_0:
                return WinSDK.D3D_ROOT_SIGNATURE_VERSION_1_0
            case .v1_1:
                return WinSDK.D3D_ROOT_SIGNATURE_VERSION_1_1
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootSignatureVersion")
public typealias D3D_ROOT_SIGNATURE_VERSION = RootSignatureVersion


@available(*, deprecated, renamed: "v1_0")
let D3D_ROOT_SIGNATURE_VERSION_1_0: RootSignatureVersion = .v1_0

@available(Windows, introduced: 10.0.14393)
@available(*, deprecated, renamed: "v1_1")
let D3D_ROOT_SIGNATURE_VERSION_1_1: RootSignatureVersion = .v1_1

#endif
