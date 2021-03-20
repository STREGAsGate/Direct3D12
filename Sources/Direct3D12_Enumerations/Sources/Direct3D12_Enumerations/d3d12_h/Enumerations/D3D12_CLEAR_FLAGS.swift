/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies what to clear from the depth stencil view.
public struct ClearFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_CLEAR_FLAGS
    public typealias RawValue = WinSDK.D3D12_CLEAR_FLAGS.RawValue
    public let rawValue: RawValue

    /// Indicates the depth buffer should be cleared.
    static let depth = ClearFlags(rawValue: WinSDK.D3D12_CLEAR_FLAG_DEPTH.rawValue)

    /// Indicates the stencil buffer should be cleared.
    static let stencil = ClearFlags(rawValue: WinSDK.D3D12_CLEAR_FLAG_STENCIL.rawValue)

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ClearFlags")
public typealias D3D12_CLEAR_FLAGS = ClearFlags


@available(*, deprecated, renamed: "ClearFlags.depth")
public let D3D12_CLEAR_FLAG_DEPTH = ClearFlags.depth

@available(*, deprecated, renamed: "ClearFlags.stencil")
public let D3D12_CLEAR_FLAG_STENCIL = ClearFlags.stencil

#endif
