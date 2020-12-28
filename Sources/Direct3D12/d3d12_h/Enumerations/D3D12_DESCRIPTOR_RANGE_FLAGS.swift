/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the volatility of both descriptors and the data they reference in a Root Signature 1.1 description, which can enable some driver optimizations.
public struct DescriptorRangeFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    /////	Default behavior. Descriptors are static, and default assumptions are made for data (for SRV/CBV: DATA_STATIC_WHILE_SET_AT_EXECUTE, and for UAV: DATA_VOLATILE).
    //static let none = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_NONE.rawValue)

    /**
    If this is the only flag set, then descriptors are volatile and default assumptions are made about data (for SRV/CBV: DATA_STATIC_WHILE_SET_AT_EXECUTE, and for UAV: DATA_VOLATILE).

    If this flag is combined with DATA_VOLATILE, then both descriptors and data are volaille, which is equivalent to Root Signature Version 1.0.

    If this flag is combined with DATA_STATIC_WHILE_SET_AT_EXECUTE, then descriptors are volatile. This still doesn’t allow them to change during command list execution so it is valid to combine the additional declaration that data is static while set via root descriptor table during execution – the underlying descriptors are effectively static for longer than the data is being promised to be static.
    */
    static let descriptorsVolatile = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_DESCRIPTORS_VOLATILE.rawValue)

    ///	Descriptors are static and the data is volatile.
    static let dataVolatile = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_DATA_VOLATILE.rawValue)

    ///	Descriptors are static and data is static while set at execute.
    static let dataStaticWhileSetAtExecute = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_DATA_STATIC_WHILE_SET_AT_EXECUTE.rawValue)
    ///	Both descriptors and data are static. This maximizes the potential for driver optimization.
    static let dataStatic = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_DATA_STATIC.rawValue)
    ///	Provides the same benefits as static descriptors (see D3D12_DESCRIPTOR_RANGE_FLAG_NONE), except that the driver is not allowed to promote buffers to root descriptors as an optimization, because they must maintain bounds checks and root descriptors do not have those.
    static let staticKeepingBufferBoundsChecks = DescriptorRangeFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_FLAG_DESCRIPTORS_STATIC_KEEPING_BUFFER_BOUNDS_CHECKS.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "DescriptorRangeFlags")
public typealias D3D12_DESCRIPTOR_RANGE_FLAGS = DescriptorRangeFlags

public extension DescriptorRangeFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_NONE: DescriptorRangeFlags = []

    @available(*, deprecated, renamed: "descriptorsVolatile")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_DESCRIPTORS_VOLATILE = Self.descriptorsVolatile

    @available(*, deprecated, renamed: "dataVolatile")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_DATA_VOLATILE = Self.dataVolatile

    @available(*, deprecated, renamed: "dataStaticWhileSetAtExecute")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_DATA_STATIC_WHILE_SET_AT_EXECUTE = Self.dataStaticWhileSetAtExecute

    @available(*, deprecated, renamed: "dataStatic")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_DATA_STATIC = Self.dataStatic

    @available(*, deprecated, renamed: "staticKeepingBufferBoundsChecks")
    static let D3D12_DESCRIPTOR_RANGE_FLAG_DESCRIPTORS_STATIC_KEEPING_BUFFER_BOUNDS_CHECKS = Self.staticKeepingBufferBoundsChecks
}
