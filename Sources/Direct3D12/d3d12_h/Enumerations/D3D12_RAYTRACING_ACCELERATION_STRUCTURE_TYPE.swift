/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of a raytracing acceleration structure.
public enum RaytracingAccelerationStructureType {
    ///	Top-level acceleration structure.
    case topLevel
    ///	Bottom-level acceleration structure.
    case bottomLevel

    internal var rawValue: _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE {
        switch self {
        case .topLevel:
            return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL
        case .bottomLevel:
            return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingAccelerationStructureType")
public typealias D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE = RaytracingAccelerationStructureType

public extension RaytracingAccelerationStructureType  {
    @available(*, deprecated, renamed: "topLevel")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL = Self.topLevel

    @available(*, deprecated, renamed: "bottomLevel")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL = Self.bottomLevel
}

#endif
