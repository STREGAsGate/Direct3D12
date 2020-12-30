/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Used with the EnqueuMakeResident function to choose how residency operations proceed when the memory budget is exceeded.
public struct ResidencyFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Specifies the default residency policy, which allows residency operations to succeed regardless of the application's current memory budget. EnqueueMakeResident returns E_OUTOFMEMORY only when there is no memory available.
    //static let none = ResidencyFlags(rawValue: _d3d12.D3D12_RESIDENCY_FLAG_NONE.rawValue)

    /// Specifies that the EnqueueMakeResident function should return E_OUTOFMEMORY when the residency operation would exceed the application's current memory budget.
    static let denyOverbudget = ResidencyFlags(rawValue: _d3d12.D3D12_RESIDENCY_FLAG_DENY_OVERBUDGET.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResidencyFlags")
public typealias D3D12_RESIDENCY_FLAGS = ResidencyFlags

public extension ResidencyFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RESIDENCY_FLAG_NONE: ResidencyFlags = []

    @available(*, deprecated, renamed: "denyOverbudget")
    static let D3D12_RESIDENCY_FLAG_DENY_OVERBUDGET = Self.denyOverbudget
}

#endif
