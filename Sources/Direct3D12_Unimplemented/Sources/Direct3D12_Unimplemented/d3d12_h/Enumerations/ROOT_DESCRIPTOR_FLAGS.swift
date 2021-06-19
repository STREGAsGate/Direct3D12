/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the volatility of the data referenced by descriptors in a Root Signature 1.1 description, which can enable some driver optimizations.
public struct RootRescriptorFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Default assumptions are made for data (for SRV/CBV: DATA_STATIC_WHILE_SET_AT_EXECUTE, and for UAV: DATA_VOLATILE).
    //public static let none = RootRescriptorFlags(rawValue: WinSDK.D3D12_ROOT_DESCRIPTOR_FLAG_NONE.rawValue)

    ///	Data is volatile. Equivalent to Root Signature Version 1.0.
    public static let dataVolatile = RootRescriptorFlags(rawValue: WinSDK.D3D12_ROOT_DESCRIPTOR_FLAG_DATA_VOLATILE.rawValue)
    ///	Data is static while set at execute.
    public static let dataStaticWhileSetAtExecute = RootRescriptorFlags(rawValue: WinSDK.D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC_WHILE_SET_AT_EXECUTE.rawValue)
    ///	Data is static. The best potential for driver optimization.
    public static let dataStatic = RootRescriptorFlags(rawValue: WinSDK.D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootRescriptorFlags")
public typealias D3D12_ROOT_DESCRIPTOR_FLAGS = RootRescriptorFlags

public extension RootRescriptorFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_ROOT_DESCRIPTOR_FLAG_NONE: RootRescriptorFlags = []

    @available(*, deprecated, renamed: "dataVolatile")
    static let D3D12_ROOT_DESCRIPTOR_FLAG_DATA_VOLATILE = Self.dataVolatile

    @available(*, deprecated, renamed: "dataStaticWhileSetAtExecute")
    static let D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC_WHILE_SET_AT_EXECUTE = Self.dataStaticWhileSetAtExecute

    @available(*, deprecated, renamed: "dataStatic")
    static let D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC = Self.dataStatic
}

#endif
