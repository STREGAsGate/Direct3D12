/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Defines constants that specify protected session status.
public enum ProtectedSessionStatus {
    ///	Indicates that the protected session is in a valid state.
    case ok
    ///	Indicates that the protected session is not in a valid state.
    case invalid

    internal var rawValue: WinSDK.D3D12_PROTECTED_SESSION_STATUS {
        switch self {
        case .ok:
            return WinSDK.D3D12_PROTECTED_SESSION_STATUS_OK
        case .invalid:
            return WinSDK.D3D12_PROTECTED_SESSION_STATUS_INVALID
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ProtectedSessionStatus")
public typealias D3D12_PROTECTED_SESSION_STATUS = ProtectedSessionStatus

public extension ProtectedSessionStatus  {
    @available(*, deprecated, renamed: "invalid")
    static let D3D12_PROTECTED_SESSION_STATUS_OK = Self.ok

    @available(*, deprecated, renamed: "invalid")
    static let D3D12_PROTECTED_SESSION_STATUS_INVALID = Self.ok
}

#endif
