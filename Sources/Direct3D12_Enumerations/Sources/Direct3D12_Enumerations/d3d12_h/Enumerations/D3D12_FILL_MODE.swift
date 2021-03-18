/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the fill mode to use when rendering triangles.
public enum FillMode {
    ///	Draw lines connecting the vertices. Adjacent vertices are not drawn.
    case wireframe
    ///	Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
    case solid

    internal var rawValue: WinSDK.D3D12_FILL_MODE {
        switch self {
        case .wireframe:
            return WinSDK.D3D12_FILL_MODE_WIREFRAME
        case .solid:
            return WinSDK.D3D12_FILL_MODE_SOLID
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FillMode")
public typealias D3D12_FILL_MODE = FillMode

public extension FillMode  {
    @available(*, deprecated, renamed: "wireframe")
    static let D3D12_FILL_MODE_WIREFRAME = Self.wireframe

    @available(*, deprecated, renamed: "solid")
    static let D3D12_FILL_MODE_SOLID = Self.solid
}

#endif
