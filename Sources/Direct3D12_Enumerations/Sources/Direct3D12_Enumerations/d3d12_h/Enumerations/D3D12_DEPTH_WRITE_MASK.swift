/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies the portion of a depth-stencil buffer for writing depth data.
public enum DepthWriteMask {
    ///	Turn off writes to the depth-stencil buffer.
    case zero
    ///	Turn on writes to the depth-stencil buffer.
    case all

    internal var rawValue: WinSDK.D3D12_DEPTH_WRITE_MASK {
        switch self {
    case .zero:
        return WinSDK.D3D12_DEPTH_WRITE_MASK_ZERO
    case .all:
        return WinSDK.D3D12_DEPTH_WRITE_MASK_ALL
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DepthWriteMask")
public typealias D3D12_DEPTH_WRITE_MASK = DepthWriteMask

public extension DepthWriteMask {
    @available(*, deprecated, renamed: "zero")
    static let D3D12_DEPTH_WRITE_MASK_ZERO = Self.zero

    @available(*, deprecated, renamed: "all")
    static let D3D12_DEPTH_WRITE_MASK_ALL = Self.all
}

#endif
