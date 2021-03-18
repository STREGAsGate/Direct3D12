/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the lifetime state of a lifetime-tracked object.
public enum LifetimeState {
    ///	Specifies that the lifetime-tracked object is in use.
    case inUse
    ///	Specifies that the lifetime-tracked object is not in use.
    case notInUse

    internal var rawValue: WinSDK.D3D12_LIFETIME_STATE {
        switch self {
        case .inUse:
            return WinSDK.D3D12_LIFETIME_STATE_IN_USE
        case .notInUse:
            return WinSDK.D3D12_LIFETIME_STATE_NOT_IN_USE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "LifetimeState")
public typealias D3D12_LIFETIME_STATE = LifetimeState

public extension LifetimeState  {
    @available(*, deprecated, renamed: "inUse")
    static let D3D12_LIFETIME_STATE_IN_USE = Self.inUse

    @available(*, deprecated, renamed: "notInUse")
    static let D3D12_LIFETIME_STATE_NOT_IN_USE = Self.notInUse
}

#endif
