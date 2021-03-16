/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the level of support for render passes on a graphics device.
public enum RenderPassTier {
    ///	The user-mode display driver hasn't implemented render passes, and so the feature is provided only via software emulation. Render passes might not provide a performance at this level of support.
    case tier0
    ///	The render passes feature is implemented by the user-mode display driver, and render target/depth buffer writes may be accelerated. Unordered access view (UAV) writes are not efficiently supported within the render pass.
    case tier1
    ///	The render passes feature is implemented by the user-mode display driver, render target/depth buffer writes may be accelerated, and unordered access view (UAV) writes (provided that writes in a render pass are not read until a subsequent render pass) are likely to be more efficient than issuing the same work without using a render pass.
    case tier2

    internal var rawValue: WinSDK.D3D12_RENDER_PASS_TIER {
        switch self {
        case .tier0:
            return WinSDK.D3D12_RENDER_PASS_TIER_0
        case .tier1:
            return WinSDK.D3D12_RENDER_PASS_TIER_1
        case .tier2:
            return WinSDK.D3D12_RENDER_PASS_TIER_2
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderPassTier")
public typealias D3D12_RENDER_PASS_TIER = RenderPassTier

public extension RenderPassTier  {
    @available(*, deprecated, renamed: "tier0")
    static let D3D12_RENDER_PASS_TIER_0 = Self.tier0

    @available(*, deprecated, renamed: "tier1")
    static let D3D12_RENDER_PASS_TIER_1 = Self.tier1

    @available(*, deprecated, renamed: "tier2")
    static let D3D12_RENDER_PASS_TIER_2 = Self.tier2
}

#endif
