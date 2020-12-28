/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Identifies the tier level of conservative rasterization.
public enum ConservativeRasterization {
    ///	Conservative rasterization is not supported.
    case notSupported
    ///	Tier 1 enforces a maximum 1/2 pixel uncertainty region and does not support post-snap degenerates. This is good for tiled rendering, a texture atlas, light map generation and sub-pixel shadow maps.
    case tier1
    ///	Tier 2 reduces the maximum uncertainty region to 1/256 and requires post-snap degenerates not be culled. This tier is helpful for CPU-based algorithm acceleration (such as voxelization).
    case tier2
    ///	Tier 3 maintains a maximum 1/256 uncertainty region and adds support for inner input coverage. Inner input coverage adds the new value SV_InnerCoverage to High Level Shading Language (HLSL). This is a 32-bit scalar integer that can be specified on input to a pixel shader, and represents the underestimated conservative rasterization information (that is, whether a pixel is guaranteed-to-be-fully covered). This tier is helpful for occlusion culling.
    case tier3

    internal var rawValue: _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_TIER {
        switch self {
        case .notSupported:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_TIER_NOT_SUPPORTED
        case .tier1:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_TIER_1
        case .tier2:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_TIER_2
        case .tier3:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_TIER_3
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ConservativeRasterization")
public typealias D3D12_CONSERVATIVE_RASTERIZATION_TIER = ConservativeRasterization

public extension ConservativeRasterization  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_CONSERVATIVE_RASTERIZATION_TIER_NOT_SUPPORTED = Self.notSupported
    
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_CONSERVATIVE_RASTERIZATION_TIER_1 = Self.tier1
    
    @available(*, deprecated, renamed: "tier2")
    static let D3D12_CONSERVATIVE_RASTERIZATION_TIER_2 = Self.tier2
    
    @available(*, deprecated, renamed: "tier3")
    static let D3D12_CONSERVATIVE_RASTERIZATION_TIER_3 = Self.tier3
}

#endif
