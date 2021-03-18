/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Indicates the tier level at which view instancing is supported.
public enum ViewInstancingTier {

///	View instancing is not supported.
case notSupported
///	View instancing is supported by draw-call level looping only.
case tier1
///	View instancing is supported by draw-call level looping at worst, but the GPU can perform view instancing more efficiently in certain circumstances which are architecture-dependent.
case tier2
/**
View instancing is supported and instancing begins with the first shader stage that references SV_ViewID or with rasterization if no shader stage references SV_ViewID. This means that redundant work is eliminated across view instances when it's not dependent on SV_ViewID. Before rasterization, work that doesn't directly depend on SV_ViewID is shared across all views; only work that depends on SV_ViewID is repeated for each view.

Note  If a hull shader produces tessellation factors that are dependent on SV_ViewID, then tessellation and all subsequent work must be repeated per-view. Similarly, if the amount of geometry produced by the geometry shader depends on SV_ViewID, then the geometry shader must be repeated per-view before proceeding to rasterization.

View instance masking only effects whether work that directly depends on SV_ViewID is performed, not the entire loop iteration (per-view). If the view instance mask is non-0, some work that depends on SV_ViewID might still be performed on masked-off pixels but will have no externally-visible effect; for example, no UAV writes are performed and clipping/rasterzation is not invoked. If the view instance mask is 0 no work is performed, including work that's not dependent on SV_ViewID.
*/
case tier3

    internal var rawValue: WinSDK.D3D12_VIEW_INSTANCING_TIER {
        switch self {
        case .notSupported:
            return WinSDK.D3D12_VIEW_INSTANCING_TIER_NOT_SUPPORTED
        case .tier1:
            return WinSDK.D3D12_VIEW_INSTANCING_TIER_1
        case .tier2:
            return WinSDK.D3D12_VIEW_INSTANCING_TIER_2
        case .tier3:
            return WinSDK.D3D12_VIEW_INSTANCING_TIER_3
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ViewInstancingTier")
public typealias D3D12_VIEW_INSTANCING_TIER = ViewInstancingTier

public extension ViewInstancingTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_VIEW_INSTANCING_TIER_NOT_SUPPORTED = Self.notSupported
    
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_VIEW_INSTANCING_TIER_1 = Self.tier1
    
    @available(*, deprecated, renamed: "tier2")
    static let D3D12_VIEW_INSTANCING_TIER_2 = Self.tier2
    
    @available(*, deprecated, renamed: "tier3")
    static let D3D12_VIEW_INSTANCING_TIER_3 = Self.tier3
}

#endif
