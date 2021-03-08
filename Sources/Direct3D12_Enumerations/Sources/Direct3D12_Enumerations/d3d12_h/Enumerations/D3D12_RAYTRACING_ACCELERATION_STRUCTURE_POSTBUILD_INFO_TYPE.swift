/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies the type of acceleration structure post-build info that can be retrieved with calls to EmitRaytracingAccelerationStructurePostbuildInfo and BuildRaytracingAccelerationStructure.
public enum RaytracingAccelerationStructurePostbuildIntoType {
    ///	The post-build info is space requirements for an acceleration structure after compaction. For more information, see D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE_DESC.
    case compactSize
    ///	The post-build info is space requirements for generating tools visualization for an acceleration structure. For more information, see D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TOOLS_VISUALIZATION_DESC.
    case toolsVisualization
    ///	The post-build info is space requirements for serializing an acceleration structure. For more information, see D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC.
    case serialization
    ///	The post-build info is size of the current acceleration structure. For more information, see D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_CURRENT_SIZE_DESC.
    case currentSize

    internal var rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TYPE {
        switch self {
        case .compactSize:
            return WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE
        case .toolsVisualization:
            return WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TOOLS_VISUALIZATION
        case .serialization:
            return WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION
        case .currentSize:
            return WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_CURRENT_SIZE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingAccelerationStructurePostbuildIntoType")
public typealias D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TYPE = RaytracingAccelerationStructurePostbuildIntoType

public extension RaytracingAccelerationStructurePostbuildIntoType  {
    @available(*, deprecated, renamed: "compactSize")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE = Self.compactSize

    @available(*, deprecated, renamed: "toolsVisualization")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TOOLS_VISUALIZATION = Self.toolsVisualization

    @available(*, deprecated, renamed: "serialization")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION = Self.serialization

    @available(*, deprecated, renamed: "currentSize")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_CURRENT_SIZE = Self.currentSize
}

#endif
