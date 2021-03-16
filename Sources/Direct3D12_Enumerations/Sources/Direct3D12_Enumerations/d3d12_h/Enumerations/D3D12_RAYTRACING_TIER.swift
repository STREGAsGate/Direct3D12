/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the level of ray tracing support on the graphics device.
public enum RaytracingTier {
///	No support for ray tracing on the device. Attempts to create any ray tracing-related object will fail, and using ray tracing-related APIs on command lists results in undefined behavior.
case notSupported
///	The device supports tier 1 ray tracing functionality. In the current release, this tier represents all available ray tracing features.
case supported
///-Note: [Documentation](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_tier) was missing at time of this Swift build.
case suportedPlus

    internal var rawValue: WinSDK.D3D12_RAYTRACING_TIER {
        switch self {
        case .notSupported:
            return WinSDK.D3D12_RAYTRACING_TIER_NOT_SUPPORTED
        case .supported:
            return WinSDK.D3D12_RAYTRACING_TIER_1_0
        case .suportedPlus:
            return WinSDK.D3D12_RAYTRACING_TIER_1_1
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingTier")
public typealias D3D12_RAYTRACING_TIER = RaytracingTier

public extension RaytracingTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_RAYTRACING_TIER_NOT_SUPPORTED = Self.notSupported

    @available(*, deprecated, renamed: "supported")
    static let D3D12_RAYTRACING_TIER_1_0 = Self.supported

    @available(*, deprecated, renamed: "suportedPlus")
    static let D3D12_RAYTRACING_TIER_1_1 = Self.suportedPlus
}

#endif
