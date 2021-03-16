/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify protected resource session flags. These flags can be bitwise OR'd together to specify multiple flags at once.
public struct ProtectedResourceSessionFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Specifies no flag.
    //static let none = ProtectedResourceSessionFlags(rawValue: WinSDK.D3D12_PROTECTED_RESOURCE_SESSION_FLAG_NONE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ProtectedResourceSessionFlags")
public typealias D3D12_PROTECTED_RESOURCE_SESSION_FLAGS = ProtectedResourceSessionFlags

public extension ProtectedResourceSessionFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_PROTECTED_RESOURCE_SESSION_FLAG_NONE: ProtectedResourceSessionFlags = []
}

#endif
