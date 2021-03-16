/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify a shading rate tier (for variable-rate shading, or VRS). For more info, see Variable-rate shading (VRS).
public enum VariableShadingRateTier {
    ///	Specifies that variable-rate shading is not supported.
    case notSupported
    ///	Specifies that variable-rate shading tier 1 is supported.
    case tier1
    ///	Specifies that variable-rate shading tier 2 is supported.
    case tier2

    internal var rawValue: WinSDK.D3D12_VARIABLE_SHADING_RATE_TIER {
        switch self {
        case .notSupported:
            return WinSDK.D3D12_VARIABLE_SHADING_RATE_TIER_NOT_SUPPORTED
        case .tier1:
            return WinSDK.D3D12_VARIABLE_SHADING_RATE_TIER_1
        case .tier2:
            return WinSDK.D3D12_VARIABLE_SHADING_RATE_TIER_2
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "VariableShadingRateTier")
public typealias D3D12_VARIABLE_SHADING_RATE_TIER = VariableShadingRateTier

public extension VariableShadingRateTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_VARIABLE_SHADING_RATE_TIER_NOT_SUPPORTED = Self.notSupported

    @available(*, deprecated, renamed: "tier1")
    static let D3D12_VARIABLE_SHADING_RATE_TIER_1 = Self.tier1

    @available(*, deprecated, renamed: "tier2")
    static let D3D12_VARIABLE_SHADING_RATE_TIER_2 = Self.tier2
}

#endif
