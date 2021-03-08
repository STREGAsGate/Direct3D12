/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Identifies the tier of resource binding being used.
public enum ResourceBindingTier {
    /// Tier 1. [See Hardware Tiers](https://docs.microsoft.com/en-us/windows/desktop/direct3d12/hardware-support).
    case tier1
    /// Tier 2. [See Hardware Tiers](https://docs.microsoft.com/en-us/windows/desktop/direct3d12/hardware-support).
    case tier2
    /// Tier 3. [See Hardware Tiers](https://docs.microsoft.com/en-us/windows/desktop/direct3d12/hardware-support).
    case tier3

    internal var rawValue: WinSDK.D3D12_RESOURCE_BINDING_TIER {
        switch self {
        case .tier1:
            return WinSDK.D3D12_RESOURCE_BINDING_TIER_1
        case .tier2:
            return WinSDK.D3D12_RESOURCE_BINDING_TIER_2
        case .tier3:
            return WinSDK.D3D12_RESOURCE_BINDING_TIER_3
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceBindingTier")
public typealias D3D12_RESOURCE_BINDING_TIER = ResourceBindingTier

public extension ResourceBindingTier  {
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_RESOURCE_BINDING_TIER_1 = Self.tier1

    @available(*, deprecated, renamed: "tier2")
    static let D3D12_RESOURCE_BINDING_TIER_2 = Self.tier2

    @available(*, deprecated, renamed: "tier3")
    static let D3D12_RESOURCE_BINDING_TIER_3 = Self.tier3
}

#endif
