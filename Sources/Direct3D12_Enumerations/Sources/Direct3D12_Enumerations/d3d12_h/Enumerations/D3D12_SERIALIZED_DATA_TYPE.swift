/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of serialized data. Use a value from this enumeration when calling ID3D12Device5::CheckDriverMatchingIdentifier.
@available(Windows, introduced: 10.0.17763)
public enum SerializedDataType {
    public typealias RawValue = WinSDK.D3D12_SERIALIZED_DATA_TYPE
    
    /// The serialized data is a raytracing acceleration structure.
    case raytracingAccelerationStructure

    public var rawValue: RawValue {
        switch self {
        case .raytracingAccelerationStructure:
            return WinSDK.D3D12_SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "SerializedDataType")
public typealias D3D12_SERIALIZED_DATA_TYPE = SerializedDataType

@available(Windows, introduced: 10.0.17763)
public extension SerializedDataType  {
    @available(*, deprecated, renamed: "raytracingAccelerationStructure")
    static let D3D12_SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE = Self.raytracingAccelerationStructure
}

#endif
