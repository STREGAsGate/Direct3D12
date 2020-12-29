/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of geometry used for raytracing. Use a value from this enumeration to specify the geometry type in a D3D12_RAYTRACING_GEOMETRY_DESC.
public enum RaytracingGeometryType {
    ///	The geometry consists of triangles.
    case triangles
    ///	The geometry procedurally is defined during raytracing by intersection shaders. For the purpose of acceleration structure builds, the geometry’s bounds are described with axis-aligned bounding boxes using the D3D12_RAYTRACING_GEOMETRY_AABBS_DESC structure.
    case proceduralPrimitiveAABBs

    internal var rawValue: _d3d12.D3D12_RAYTRACING_GEOMETRY_TYPE {
        switch self {
        case .triangles:
            return _d3d12.D3D12_RAYTRACING_GEOMETRY_TYPE_TRIANGLES
        case .proceduralPrimitiveAABBs:
            return _d3d12.D3D12_RAYTRACING_GEOMETRY_TYPE_PROCEDURAL_PRIMITIVE_AABBS
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingGeometryType")
public typealias D3D12_RAYTRACING_GEOMETRY_TYPE = RaytracingGeometryType

public extension RaytracingGeometryType  {
    @available(*, deprecated, renamed: "triangles")
    static let D3D12_RAYTRACING_GEOMETRY_TYPE_TRIANGLES = Self.triangles

    @available(*, deprecated, renamed: "triangles")
    static let D3D12_RAYTRACING_GEOMETRY_TYPE_PROCEDURAL_PRIMITIVE_AABBS = Self.triangles
}

#endif
