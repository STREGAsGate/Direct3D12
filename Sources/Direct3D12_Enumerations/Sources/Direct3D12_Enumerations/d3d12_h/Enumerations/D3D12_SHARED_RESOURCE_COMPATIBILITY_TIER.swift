/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify a cross-API sharing support tier.
/// The resource data formats mentioned are members of the DXGI_FORMAT enumeration.
public enum SharedResourceCompatibilityTier {
/**
Specifies that the most basic level of cross-API sharing is supported, including the following resource data formats.

* DXGI_FORMAT_R8G8B8A8_UNORM
* DXGI_FORMAT_R8G8B8A8_UNORM_SRGB
* DXGI_FORMAT_B8G8R8A8_UNORM
* DXGI_FORMAT_B8G8R8A8_UNORM_SRGB
* DXGI_FORMAT_B8G8R8X8_UNORM
* DXGI_FORMAT_B8G8R8X8_UNORM_SRGB
* DXGI_FORMAT_R10G10B10A2_UNORM
* DXGI_FORMAT_R16G16B16A16_FLOAT
*/
case tier0
/**
Specifies that cross-API sharing functionality of Tier 0 is supported, plus the following formats.

* DXGI_FORMAT_R16G16B16A16_TYPELESS
* DXGI_FORMAT_R10G10B10A2_TYPELESS
* DXGI_FORMAT_R8G8B8A8_TYPELESS
* DXGI_FORMAT_R8G8B8X8_TYPELESS
* DXGI_FORMAT_R16G16_TYPELESS
* DXGI_FORMAT_R8G8_TYPELESS
* DXGI_FORMAT_R32_TYPELESS
* DXGI_FORMAT_R16_TYPELESS
* DXGI_FORMAT_R8_TYPELESS

This level support is built into WDDM 2.4.

Also see Extended support for shared Texture2D resources.
*/
case tier1
/**
Specifies that cross-API sharing functionality of Tier 1 is supported, plus the following formats.

* DXGI_FORMAT_NV12 (also see Extended NV12 texture support)
*/
case tier2

    internal var rawValue: WinSDK.D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER {
        switch self {
        case .tier0:
            return WinSDK.D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_0
        case .tier1:
            return WinSDK.D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_1
        case .tier2:
            return WinSDK.D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_2
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "SharedResourceCompatibilityTier")
public typealias D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER = SharedResourceCompatibilityTier

public extension SharedResourceCompatibilityTier {
    @available(*, deprecated, renamed: "tier0")
    static let D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_0 = Self.tier0
    
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_1 = Self.tier1
    
    @available(*, deprecated, renamed: "tier2")
    static let D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_2 = Self.tier2
}

#endif
