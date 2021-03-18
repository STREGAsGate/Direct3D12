/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a type of resource barrier (transition in resource use) description.
public enum ResourceBarrierType {
    ///	A transition barrier that indicates a transition of a set of subresources between different usages. The caller must specify the before and after usages of the subresources.
    case transition
    ///	An aliasing barrier that indicates a transition between usages of 2 different resources that have mappings into the same tile pool. The caller can specify both the before and the after resource. Note that one or both resources can be NULL, which indicates that any tiled resource could cause aliasing.
    case aliasing
    ///	An unordered access view (UAV) barrier that indicates all UAV accesses (reads or writes) to a particular resource must complete before any future UAV accesses (read or write) can begin.
    case unorderedAccessView

    internal var rawValue: WinSDK.D3D12_RESOURCE_BARRIER_TYPE {
        switch self {
        case .transition:
            return WinSDK.D3D12_RESOURCE_BARRIER_TYPE_TRANSITION
        case .aliasing:
            return WinSDK.D3D12_RESOURCE_BARRIER_TYPE_ALIASING
        case .unorderedAccessView:
            return WinSDK.D3D12_RESOURCE_BARRIER_TYPE_UAV
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceBarrierType")
public typealias D3D12_RESOURCE_BARRIER_TYPE = ResourceBarrierType

public extension ResourceBarrierType  {
    @available(*, deprecated, renamed: "transition")
    static let D3D12_RESOURCE_BARRIER_TYPE_TRANSITION = Self.transition

    @available(*, deprecated, renamed: "aliasing")
    static let D3D12_RESOURCE_BARRIER_TYPE_ALIASING = Self.aliasing

    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_RESOURCE_BARRIER_TYPE_UAV = Self.unorderedAccessView
}

#endif
