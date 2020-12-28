/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies triangles facing a particular direction are not drawn.
public enum CullMode {
    ///	Always draw all triangles.
    case disabled
    ///	Do not draw triangles that are front-facing.
    case front
    ///	Do not draw triangles that are back-facing.
    case back

    internal var rawValue: _d3d12.D3D12_CULL_MODE {
        switch self {
        case .disabled:
            return _d3d12.D3D12_CULL_MODE_NONE
        case .front:
            return _d3d12.D3D12_CULL_MODE_FRONT
        case .back:
            return _d3d12.D3D12_CULL_MODE_BACK
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CullMode")
public typealias D3D12_CULL_MODE = CullMode

public extension CullMode  {
    @available(*, deprecated, renamed: "disabled")
    static let D3D12_CULL_MODE_NONE = Self.disabled

    @available(*, deprecated, renamed: "front")
    static let D3D12_CULL_MODE_FRONT = Self.front

    @available(*, deprecated, renamed: "back")
    static let D3D12_CULL_MODE_BACK = Self.back
}

#endif
