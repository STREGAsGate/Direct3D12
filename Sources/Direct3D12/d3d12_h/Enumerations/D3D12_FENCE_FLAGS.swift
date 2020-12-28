/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies fence options.
public struct FenceFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// 	No options are specified.
    //static let none = FenceFlags(rawValue: _d3d12.D3D12_FENCE_FLAG_NONE.rawValue)

    /// The fence is shared.
    static let shared = FenceFlags(rawValue: _d3d12.D3D12_FENCE_FLAG_SHARED.rawValue)
    	
    /// The fence is shared with another GPU adapter.
    static let sharedCrossAdapter = FenceFlags(rawValue: _d3d12.D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER.rawValue)
	
    /// The fence is of the non-monitored type. Non-monitored fences should only be used when the adapter doesn't support monitored fences, or when a fence is shared with an adapter that doesn't support monitored fences.
    static let nonMonitored = FenceFlags(rawValue: _d3d12.D3D12_FENCE_FLAG_NON_MONITORED.rawValue)


    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FenceFlags")
public typealias D3D12_FENCE_FLAGS = FenceFlags

public extension FenceFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_FENCE_FLAG_NONE: FenceFlags = []

    @available(*, deprecated, renamed: "shared")
    static let D3D12_FENCE_FLAG_SHARED = Self.shared

    @available(*, deprecated, renamed: "sharedCrossAdapter")
    static let D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER = Self.sharedCrossAdapter
	
    @available(*, deprecated, renamed: "nonMonitored")
    static let D3D12_FENCE_FLAG_NON_MONITORED = Self.nonMonitored
}

#endif
