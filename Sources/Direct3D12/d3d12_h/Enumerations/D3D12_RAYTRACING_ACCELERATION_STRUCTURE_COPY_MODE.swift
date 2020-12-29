/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the type of copy operation performed when calling CopyRaytracingAccelerationStructure.
public enum RaytracingAccelerationStructureCopyMode {
    /**
    Copy an acceleration structure while fixing any self-referential pointers that may be present so that the destination is a self-contained copy of the source. Any external pointers to other acceleration structures remain unchanged from source to destination in the copy. The size of the destination is identical to the size of the source.

    > [!IMPORTANT]
    > The source memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    > The destination memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    */
    case clone
    /**
    Produces a functionally equivalent acceleration structure to source in the destination, similar to the clone mode, but also fits the destination into a potentially smaller, and certainly not larger, memory footprint. The size required for the destination can be retrieved beforehand from EmitRaytracingAccelerationStructurePostbuildInfo.

    This mode is only valid if the source acceleration structure was originally built with the D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION flag, otherwise results are undefined.

    Compacting geometry requires the entire acceleration structure to be constructed, which is why you must first build and then compact the structure.

    > [!IMPORTANT]
    > The source memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    > The destination memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    */
    case compact
    /**
    The destination is takes the layout described in D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_TOOLS_VISUALIZATION_HEADER. The size required for the destination can be retrieved beforehand from EmitRaytracingAccelerationStructurePostbuildInfo.

    This mode is only intended for tools such as PIX, though nothing stops any app from using it. The output is essentially the inverse of an acceleration structure build. This overall structure with is sufficient for tools/PIX to be able to give the application some visual sense of the acceleration structure the driver made out of the app’s input. Visualization can help reveal driver bugs in acceleration structures if what is shown grossly mismatches the data the application used to create the acceleration structure, beyond allowed tolerances.

    For top-level acceleration structures, the output includes a set of instance descriptions that are identical to the data used in the original build and in the same order. For bottom-level acceleration structures, the output includes a set of geometry descriptions roughly matching the data used in the original build. The output is only a rough match for the original in part because of the tolerances allowed in the specification for acceleration structures and in part due to the inherent complexity of reporting exactly the same structure as is conceptually encoded. For example. axis-aligned bounding boxes (AABBs) returned for procedural primitives could be more conservative (larger) in volume and even different in number than what is actually in the acceleration structure representation. Geometries, each with its own geometry description, appear in the same order as in the original acceleration, as shader table indexing calculations depend on this.


    > [!IMPORTANT]
    > The source memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    > The destination memory must be in state D3D12_RESOURCE_STATE_UNORDERED_ACCESS.

    This mode is only permitted when developer mode is enabled in the OS.
    */
    case visualizationDecodeForTools
    /**
    Destination takes the layout and size described in the documentation for D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC, itself a structure generated with a call to EmitRaytracingAccelerationStructurePostbuildInfo.

    This mode serializes an acceleration structure so that an app or tools can store it to a file for later reuse, typically on a different device instance, via deserialization.

    When serializing a top-level acceleration structure, the bottom-level acceleration structures it refers to do not have to still be present or intact in memory. Likewise, bottom-level acceleration structures can be serialized independent of whether any top-level acceleration structures are pointing to them. In other words, the order of serialization of acceleration structures doesn’t matter.

    > [!IMPORTANT]
    > The source memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    > The destination memory must be in state D3D12_RESOURCE_STATE_UNORDERED_ACCESS.
    */
    case serialize
    /**
    The source must be a serialized acceleration structure, with any pointers, directly after the header, fixed to point to their new locations. For more information, see D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC.

    The destination gets an acceleration structure that is functionally equivalent to the acceleration structure that was originally serialized. It does not matter what order top-level and bottom-level acceleration structures are deserialized, as long as by the time a top-level acceleration structure is used for raytracing or acceleration structure updates the bottom-level acceleration structures it references are present.

    Deserialization can only be performed on the same device and driver version on which the data was serialized. Otherwise, the results are undefined.

    This mode is only intended for tools such as PIX, though nothing stops any app from using it, but this mode is only permitted when developer mode is enabled in the OS. This copy operation is not intended to be used for caching acceleration structures, because running a full acceleration structure build is likely to be faster than loading one from disk.


    > [!IMPORTANT]
    > The source memory must be in state D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE.
    > The destination memory must be in state D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.
    */
    case deserialize

    internal var rawValue: _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE {
        switch self {
    case .clone:
        return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_CLONE
    case .compact:
        return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_COMPACT
    case .visualizationDecodeForTools:
        return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_VISUALIZATION_DECODE_FOR_TOOLS
    case .serialize:
        return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_SERIALIZE
    case .deserialize:
        return _d3d12.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_DESERIALIZE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingAccelerationStructureCopyMode")
public typealias D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE = RaytracingAccelerationStructureCopyMode

public extension RaytracingAccelerationStructureCopyMode  {
    @available(*, deprecated, renamed: "clone")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_CLONE = Self.clone

    @available(*, deprecated, renamed: "compact")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_COMPACT = Self.compact

    @available(*, deprecated, renamed: "visualizationDecodeForTools")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_VISUALIZATION_DECODE_FOR_TOOLS = Self.visualizationDecodeForTools

    @available(*, deprecated, renamed: "serialize")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_SERIALIZE = Self.serialize

    @available(*, deprecated, renamed: "deserialize")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_DESERIALIZE = Self.deserialize
}

#endif
