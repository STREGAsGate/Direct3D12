/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

// Identifies the tier level at which tiled resources are supported.
public enum TiledResourceTier {
    /**
    Indicates that textures cannot be created with the D3D12_TEXTURE_LAYOUT_64KB_UNDEFINED_SWIZZLE layout.



    ID3D12Device::CreateReservedResource cannot be used, not even for buffers.
    */
    case notSupported
    /**
    Indicates that 2D textures can be created with the D3D12_TEXTURE_LAYOUT_64KB_UNDEFINED_SWIZZLE layout.
    Limitations exist for certain resource formats and properties.
    For more details, see D3D12_TEXTURE_LAYOUT_64KB_UNDEFINED_SWIZZLE.



    ID3D12Device::CreateReservedResource can be used.


    GPU reads or writes to NULL mappings are undefined.
    Applications are encouraged to workaround this limitation by repeatedly mapping the same page to everywhere a NULL mapping would've been used.


    When the size of a texture mipmap level is an integer multiple of the standard tile shape for its format, it is guaranteed to be nonpacked.
    */
    case tier1
    /**
    Indicates that a superset of Tier_1 functionality is supported, including this additional support:



    When the size of a texture mipmap level is at least one standard tile shape for its format, the mipmap level is guaranteed to be nonpacked.
    For more info, see D3D12_PACKED_MIP_INFO.

    Shader instructions are available for clamping level-of-detail (LOD) and for obtaining status about the shader operation.
    For info about one of these shader instructions, see Sample(S,float,int,float,uint).
    Sample(S,float,int,float,uint).

    Reading from NULL-mapped tiles treat that sampled value as zero.
    Writes to NULL-mapped tiles are discarded.


    Adapters that support feature level 12_0 all support TIER_2 or greater.
    */
    case tier2
    ///	Indicates that a superset of Tier 2 is supported, with the addition that 3D textures (Volume Tiled Resources) are supported.
    case tier3
    case tier4

    internal var rawValue: WinSDK.D3D12_TILED_RESOURCES_TIER {
        switch self {
        case .notSupported:
            return WinSDK.D3D12_TILED_RESOURCES_TIER_NOT_SUPPORTED
        case .tier1:
            return WinSDK.D3D12_TILED_RESOURCES_TIER_1
        case .tier2:
            return WinSDK.D3D12_TILED_RESOURCES_TIER_2
        case .tier3:
            return WinSDK.D3D12_TILED_RESOURCES_TIER_3
        case .tier4:
            return WinSDK.D3D12_TILED_RESOURCES_TIER_4
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TiledResourceTier")
public typealias D3D12_TILED_RESOURCES_TIER = TiledResourceTier

public extension TiledResourceTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_TILED_RESOURCES_TIER_NOT_SUPPORTED = Self.notSupported
    
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_TILED_RESOURCES_TIER_1 = Self.tier1
    
    @available(*, deprecated, renamed: "tier2")
    static let D3D12_TILED_RESOURCES_TIER_2 = Self.tier2
    
    @available(*, deprecated, renamed: "tier3")
    static let D3D12_TILED_RESOURCES_TIER_3 = Self.tier3
    
    @available(*, deprecated, renamed: "tier4")
    static let D3D12_TILED_RESOURCES_TIER_4 = Self.tier4
}

#endif
