/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of serialized data. Use a value from this enumeration when calling ID3D12Device5::CheckDriverMatchingIdentifier.
public enum SerializedDataType {
    /// The serialized data is a raytracing acceleration structure.
    case raytracingAccelerationStructure

    internal var rawValue: _d3d12.D3D12_SERIALIZED_DATA_TYPE {
        switch self {
        case .raytracingAccelerationStructure:
            return _d3d12.D3D12_SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "SerializedDataType")
public typealias D3D12_SERIALIZED_DATA_TYPE = SerializedDataType

public extension SerializedDataType  {
    @available(*, deprecated, renamed: "raytracingAccelerationStructure")
    static let D3D12_SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE = Self.raytracingAccelerationStructure
}

#endif
