/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies what to clear from the depth stencil view.
public struct ClearFlags: OptionSet {
    public let rawValue: Int32

    /// Indicates the depth buffer should be cleared.
    static let depth = ClearFlags(rawValue: WinSDK.D3D12_CLEAR_FLAG_DEPTH.rawValue)

    /// Indicates the stencil buffer should be cleared.
    static let stencil = ClearFlags(rawValue: WinSDK.D3D12_CLEAR_FLAG_STENCIL.rawValue)

    public init(rawValue: Int32) {
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

public extension ClearFlags {
    @available(*, deprecated, renamed: "depth")
    static let D3D12_CLEAR_FLAG_DEPTH = Self.depth

    @available(*, deprecated, renamed: "stencil")
    static let D3D12_CLEAR_FLAG_STENCIL = Self.stencil
}

#endif
