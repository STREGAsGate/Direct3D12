/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies the portion of a depth-stencil buffer for writing depth data.
public enum D3DDepthWriteMask {
    public typealias RawValue = WinSDK.D3D12_DEPTH_WRITE_MASK
    ///	Turn off writes to the depth-stencil buffer.
    case zero
    ///	Turn on writes to the depth-stencil buffer.
    case all

    /// This Swift Package had no implementation, this can happen if the Base API is expanded.
    case _unimplemented(RawValue)

    public var rawValue: RawValue {
        switch self {
        case .zero:
            return WinSDK.D3D12_DEPTH_WRITE_MASK_ZERO
        case .all:
            return WinSDK.D3D12_DEPTH_WRITE_MASK_ALL
        case let ._unimplemented(rawValue):
            return rawValue
        }
    }

    public init(_ rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_DEPTH_WRITE_MASK_ZERO:
            self =  .zero
        case WinSDK.D3D12_DEPTH_WRITE_MASK_ALL:
            self =  .all
        default:
            self = ._unimplemented(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDepthWriteMask")
public typealias D3D12_DEPTH_WRITE_MASK = D3DDepthWriteMask


@available(*, deprecated, renamed: "D3DDepthWriteMask.zero")
public let D3D12_DEPTH_WRITE_MASK_ZERO = D3DDepthWriteMask.zero

@available(*, deprecated, renamed: "D3DDepthWriteMask.all")
public let D3D12_DEPTH_WRITE_MASK_ALL = D3DDepthWriteMask.all

#endif
