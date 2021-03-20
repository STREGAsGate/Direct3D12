/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies fence options.
public struct D3DFenceFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_FENCE_FLAGS
    public typealias RawValue = WinSDK.D3D12_FENCE_FLAGS.RawValue
    public let rawValue: RawValue
    //Use an empty collection `[]` to represent none in Swift.
    ///// 	No options are specified.
    //static let none = FenceFlags(rawValue: WinSDK.D3D12_FENCE_FLAG_NONE.rawValue)

    /// The fence is shared.
    static let shared = D3DFenceFlags(rawValue: WinSDK.D3D12_FENCE_FLAG_SHARED.rawValue)
    	
    /// The fence is shared with another GPU adapter.
    static let sharedCrossAdapter = D3DFenceFlags(rawValue: WinSDK.D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER.rawValue)
	
    /// The fence is of the non-monitored type. Non-monitored fences should only be used when the adapter doesn't support monitored fences, or when a fence is shared with an adapter that doesn't support monitored fences.
    static let nonMonitored = D3DFenceFlags(rawValue: WinSDK.D3D12_FENCE_FLAG_NON_MONITORED.rawValue)


    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DFenceFlags")
public typealias D3D12_FENCE_FLAGS = D3DFenceFlags


@available(*, deprecated, message: "Use [] to represent none in Swift.")
public let D3D12_FENCE_FLAG_NONE: D3DFenceFlags = []

@available(*, deprecated, renamed: "D3DFenceFlags.shared")
public let D3D12_FENCE_FLAG_SHARED = D3DFenceFlags.shared

@available(*, deprecated, renamed: "D3DFenceFlags.sharedCrossAdapter")
public let D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER = D3DFenceFlags.sharedCrossAdapter

@available(*, deprecated, renamed: "D3DFenceFlags.nonMonitored")
public let D3D12_FENCE_FLAG_NON_MONITORED = D3DFenceFlags.nonMonitored

#endif
