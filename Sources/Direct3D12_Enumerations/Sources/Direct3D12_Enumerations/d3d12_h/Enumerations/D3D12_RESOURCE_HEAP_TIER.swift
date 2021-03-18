/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies which resource heap tier the hardware and driver support.
public enum ResourceHeapTier {
    /**
    Indicates that heaps can only support resources from a single resource category.
    For the list of resource categories, see Remarks.
    In tier 1, these resource categories are mutually exclusive and cannot be used with the same heap.
    The resource category must be declared when creating a heap, using the correct D3D12_HEAP_FLAGS enumeration constant.
    Applications cannot create heaps with flags that allow all three categories.
    */
    case tier1
    /**
    Indicates that heaps can support resources from all three categories.
    For the list of resource categories, see Remarks.
    In tier 2, these resource categories can be mixed within the same heap.
    Applications may create heaps with flags that allow all three categories; but are not required to do so.
    Applications may be written to support tier 1 and seamlessly run on tier 2.
    */
    case tier2

    internal var rawValue: WinSDK.D3D12_RESOURCE_HEAP_TIER {
        switch self {
        case .tier1:
            return WinSDK.D3D12_RESOURCE_HEAP_TIER_1
        case .tier2:
            return WinSDK.D3D12_RESOURCE_HEAP_TIER_2
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceHeapTier")
public typealias D3D12_RESOURCE_HEAP_TIER = ResourceHeapTier

public extension ResourceHeapTier  {
    @available(*, deprecated, renamed: "tier1")
    static let D3D12_RESOURCE_HEAP_TIER_1 = Self.tier1
    
    @available(*, deprecated, renamed: "tier2")
    static let D3D12_RESOURCE_HEAP_TIER_2 = Self.tier2
}

#endif
