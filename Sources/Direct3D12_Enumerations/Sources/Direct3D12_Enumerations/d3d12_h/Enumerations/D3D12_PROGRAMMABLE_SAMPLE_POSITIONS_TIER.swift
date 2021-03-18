/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the level of support for programmable sample positions that's offered by the adapter.
public enum ProgrammableSamplePositionsTier {
    ///	Indicates that there's no support for programmable sample positions.
    case notSupported
    ///	Indicates that there's tier 1 support for programmable sample positions. In tier 1, a single sample pattern can be specified to repeat for every pixel (SetSamplePosition parameter NumPixels = 1) and ResolveSubResource is supported.
    case singleSamplePattern
    ///	Indicates that there's tier 2 support for programmable sample positions. In tier 2, four separate sample patterns can be specified for each pixel in a 2x2 grid (SetSamplePosition parameter NumPixels = 1) that repeats over the render-target or viewport, aligned on even coordinates .
    case multipleSamplePatterns

    internal var rawValue: WinSDK.D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER {
        switch self {
        case .notSupported:
            return WinSDK.D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_NOT_SUPPORTED
        case .singleSamplePattern:
            return WinSDK.D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_1
        case .multipleSamplePatterns:
            return WinSDK.D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_2
        }
    }
} 
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ProgrammableSamplePositionsTier")
public typealias D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER = ProgrammableSamplePositionsTier

public extension ProgrammableSamplePositionsTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_NOT_SUPPORTED = Self.notSupported

    @available(*, deprecated, renamed: "singleSamplePattern")
    static let D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_1 = Self.singleSamplePattern

    @available(*, deprecated, renamed: "multipleSamplePatterns")
    static let D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_2 = Self.multipleSamplePatterns
}

#endif
