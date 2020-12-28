/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the level of sharing across nodes of an adapter, such as Tier 1 Emulated, Tier 1, or Tier 2.
public enum CrossNodeSharing {
    /// If an adapter has only 1 node, then cross-node sharing doesn't apply, so the CrossNodeSharingTier member of the [D3D12_FEATURE_DATA_D3D12_OPTIONS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options) structure is set to D3D12_CROSS_NODE_SHARING_NOT_SUPPORTED.
    case notSupported
    /// Tier 1 Emulated. Devices that set the CrossNodeSharingTier member of the [D3D12_FEATURE_DATA_D3D12_OPTIONS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options) structure to D3D12_CROSS_NODE_SHARING_TIER_1_EMULATED have Tier 1 support.
    /// However, drivers stage these copy operations through a driver-internal system memory allocation. This will cause these copy operations to consume time on the destination GPU as well as the source.
    case tier1Emulated
    /**
    Tier 1. Devices that set the CrossNodeSharingTier member of the [D3D12_FEATURE_DATA_D3D12_OPTIONS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options) structure to D3D12_CROSS_NODE_SHARING_TIER_1 only support the following cross-node copy operations:

    * [ID3D12CommandList::CopyBufferRegion](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion)
    * [ID3D12CommandList::CopyTextureRegion](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion)
    * [ID3D12CommandList::CopyResource](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copyresource)

    Additionally, the cross-node resource must be the destination of the copy operation.
    */
    case tier1

    /**
    Tier 2. Devices that set the CrossNodeSharingTier member of the [D3D12_FEATURE_DATA_D3D12_OPTIONS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options) structure to D3D12_CROSS_NODE_SHARING_TIER_2 support all operations across nodes, except for the following:

    * Render target views.
    * Depth stencil views.
    * UAV atomic operations. Similar to CPU/GPU interop, shaders may perform UAV atomic operations; however, no atomicity across adapters is guaranteed.

    Applications can retrieve the node where a resource/heap exists from the [D3D12_HEAP_DESC](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc) structure. These values are retrievable for opened resources. The runtime performs the appropriate re-mapping in case the 2 devices are using different UMD-specified node re-mappings.
    */
    case tier2
    ///Indicates support for [D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags) on heaps that are visible to multiple nodes.
    case tier3

    internal var rawValue: _d3d12.D3D12_CROSS_NODE_SHARING_TIER {
        switch self {
        case .notSupported:
            return _d3d12.D3D12_CROSS_NODE_SHARING_TIER_NOT_SUPPORTED
        case .tier1Emulated:
            return _d3d12.D3D12_CROSS_NODE_SHARING_TIER_1_EMULATED
        case .tier1:
            return _d3d12.D3D12_CROSS_NODE_SHARING_TIER_1
        case .tier2:
            return _d3d12.D3D12_CROSS_NODE_SHARING_TIER_2
        case .tier3:
            return _d3d12.D3D12_CROSS_NODE_SHARING_TIER_3
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "CrossNodeSharing")
public typealias D3D12_CROSS_NODE_SHARING_TIER = CrossNodeSharing

public extension CrossNodeSharing  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_CROSS_NODE_SHARING_TIER_NOT_SUPPORTED = Self.notSupported

    @available(*, deprecated, renamed: "tier1Emulated")
    static let D3D12_CROSS_NODE_SHARING_TIER_1_EMULATED = Self.tier1Emulated

    @available(*, deprecated, renamed: "tier1")
    static let D3D12_CROSS_NODE_SHARING_TIER_1 = Self.tier1

    @available(*, deprecated, renamed: "tier2")
    static let D3D12_CROSS_NODE_SHARING_TIER_2 = Self.tier2

    @available(*, deprecated, renamed: "tier3")
    static let D3D12_CROSS_NODE_SHARING_TIER_3 = Self.tier3
}
