/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Flags for setting split resource barriers
public struct ResourceBarrierFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No flags.
    //static let none = ResourceBarrierFlags(rawValue: _d3d12.D3D12_RESOURCE_BARRIER_FLAG_NONE.rawValue)

    /// This starts a barrier transition in a new state, putting a resource in a temporary no-access condition.
    static let beginOnly = ResourceBarrierFlags(rawValue: _d3d12.D3D12_RESOURCE_BARRIER_FLAG_BEGIN_ONLY.rawValue)

    /// This barrier completes a transition, setting a new state and restoring active access to a resource.
    static let endOnly = ResourceBarrierFlags(rawValue: _d3d12.D3D12_RESOURCE_BARRIER_FLAG_END_ONLY.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceBarrierFlags")
public typealias D3D12_RESOURCE_BARRIER_FLAGS = ResourceBarrierFlags

public extension ResourceBarrierFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RESOURCE_BARRIER_FLAG_NONE: ResourceBarrierFlags = []

    @available(*, deprecated, renamed: "beginOnly")
    static let D3D12_RESOURCE_BARRIER_FLAG_BEGIN_ONLY = Self.beginOnly

    @available(*, deprecated, renamed: "endOnly")
    static let D3D12_RESOURCE_BARRIER_FLAG_END_ONLY = Self.endOnly
}

#endif
