/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify protected resource session support.
public struct ProtectedResourceSessionSupportFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates that protected resource sessions are not supported.
    //static let none = ProtectedResourceSessionSupportFlags(rawValue: WinSDK.D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_NONE.rawValue)

    /// Indicates that protected resource sessions are supported.
    static let supported = ProtectedResourceSessionSupportFlags(rawValue: WinSDK.D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_SUPPORTED.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ProtectedResourceSessionSupportFlags")
public typealias D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS = ProtectedResourceSessionSupportFlags

public extension ProtectedResourceSessionSupportFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_NONE: ProtectedResourceSessionSupportFlags = []

    @available(*, deprecated, renamed: "supported")
    static let D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_SUPPORTED = Self.supported
}

#endif
