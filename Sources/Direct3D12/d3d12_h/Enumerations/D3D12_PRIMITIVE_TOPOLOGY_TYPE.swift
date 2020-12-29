/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies how the pipeline interprets geometry or hull shader input primitives.
public enum PrimitiveTopologyType {
    ///	The shader has not been initialized with an input primitive type.
    case undefined
    ///	Interpret the input primitive as a point.
    case point
    ///	Interpret the input primitive as a line.
    case line
    ///	Interpret the input primitive as a triangle.
    case triangle
    ///	Interpret the input primitive as a control point patch.
    case patch

    internal var rawValue: _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE {
        switch self {
        case .undefined:
            return _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE_UNDEFINED
        case .point:
            return _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE_POINT
        case .line:
            return _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE_LINE
        case .triangle:
            return _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE
        case .patch:
            return _d3d12.D3D12_PRIMITIVE_TOPOLOGY_TYPE_PATCH
        }
    }
} 
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PrimitiveTopologyType")
public typealias D3D12_PRIMITIVE_TOPOLOGY_TYPE = PrimitiveTopologyType

public extension PrimitiveTopologyType  {
    @available(*, deprecated, renamed: "undefined")
    static let D3D12_PRIMITIVE_TOPOLOGY_TYPE_UNDEFINED = Self.undefined

    @available(*, deprecated, renamed: "point")
    static let D3D12_PRIMITIVE_TOPOLOGY_TYPE_POINT = Self.point

    @available(*, deprecated, renamed: "line")
    static let D3D12_PRIMITIVE_TOPOLOGY_TYPE_LINE = Self.line

    @available(*, deprecated, renamed: "triangle")
    static let D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE = Self.triangle

    @available(*, deprecated, renamed: "patch")
    static let D3D12_PRIMITIVE_TOPOLOGY_TYPE_PATCH = Self.patch
}

#endif
