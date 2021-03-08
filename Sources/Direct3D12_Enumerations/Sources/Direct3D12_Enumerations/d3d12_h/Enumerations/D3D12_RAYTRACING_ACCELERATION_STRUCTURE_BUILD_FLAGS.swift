/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies flags for the build of a raytracing acceleration structure. Use a value from this enumeration with the D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS structure that provides input to the acceleration structure build operation.
public struct RaytracingAccelerationStructureBuildFalgs: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// No options specified for the acceleration structure build.
    //static let none = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_NONE.rawValue)

    /**
    Build the acceleration structure such that it supports future updates (via the flag D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PERFORM_UPDATE) instead of the app having to entirely rebuild the structure. This option may result in increased memory consumption, build times, and lower raytracing performance. Future updates, however, should be faster than building the equivalent acceleration structure from scratch.

    This flag can only be set on an initial acceleration structure build, or on an update where the source acceleration structure specified D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE. In other words, after an acceleration structure was been built without D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE, no other acceleration structures can be created from it via updates.
    */
    static let allowUpdates = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE.rawValue)
    /**
    Enables the option to compact the acceleration structure by calling CopyRaytracingAccelerationStructure using compact mode, specified with D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_COMPACT.

    This option may result in increased memory consumption and build times. After future compaction, however, the resulting acceleration structure should consume a smaller memory footprint than building the acceleration structure from scratch.

    This flag is compatible with all other flags. If specified as part of an acceleration structure update, the source acceleration structure must have also been built with this flag. In other words, after an acceleration structure was been built without D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION, no other acceleration structures can be created from it via updates that specify D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION.



    Specifying ALLOW_COMPACTION may increase pre-compaction acceleration structure size versus not specifying ALLOW_COMPACTION.



    If multiple incremental builds are performed before finally compacting, there may be redundant compaction related work performed.


    The size required for the compacted acceleration structure can be queried before compaction via EmitRaytracingAccelerationStructurePostbuildInfo. See D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE_DESC for more information on properties of compacted acceleration structure size.

    Note  WhenD3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE is specified, there is certain information that needs to be retained in the acceleration structure, and compaction will only help so much. However, if the pipeline knows that the acceleration structure will no longer be updated, it can make the structure more compact. Some apps may benefit from compacting twice - once after the initial build, and again after the acceleration structure has settled to a static state, if that occurs.

    */
    static let allowCompaction = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION.rawValue)
    /**
    Construct a high quality acceleration structure that maximizes raytracing performance at the expense of additional build time. Typically, the implementation will take 2-3 times the build time than the default setting in order to get better tracing performance.

    This flag is recommended for static geometry in particular. It is compatible with all other flags except for D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_BUILD.
    */
    static let preferFastTrace = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_TRACE.rawValue)
    /**
    Construct a lower quality acceleration structure, trading raytracing performance for build speed. Typically, the implementation will take 1/2 to 1/3 the build time than default setting, with a sacrifice in tracing performance.

    This flag is compatible with all other flags except for D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_BUILD.
    */
    static let preferFastBuild = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_BUILD.rawValue)
    /**
    Minimize the amount of scratch memory used during the acceleration structure build as well as the size of the result. This option may result in increased build times and/or raytracing times. This is orthogonal to the D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION flag and the explicit acceleration structure compaction that it enables. Combining the flags can mean both the initial acceleration structure as well as the result of compacting it use less memory.

    The impact of using this flag for a build is reflected in the result of calling GetRaytracingAccelerationStructurePrebuildInfo before doing the build to retrieve memory requirements for the build.

    This flag is compatible with all other flags.
    */
    static let minimizeMemory = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_MINIMIZE_MEMORY.rawValue)
    /**
    Perform an acceleration structure update, as opposed to building from scratch. This is faster than a full build, but can negatively impact raytracing performance, especially if the positions of the underlying objects have changed significantly from the original build of the acceleration structure before updates.

    If the addresses of the source and destination acceleration structures are identical, the update is performed in-place. Any other overlapping of address ranges of the source and destination is invalid. For non-overlapping source and destinations, the source acceleration structure is unmodified. The memory requirement for the output acceleration structure is the same as in the input acceleration structure

    The source acceleration structure must have been built with D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE.

    This flag is compatible with all other flags. The other flags selections, aside from D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE and D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PERFORM_UPDATE, must match the flags in the source acceleration structure.

    Acceleration structure updates can be performed in unlimited succession, as long as the source acceleration structure was created with D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE and the flags for the update build continue to specify D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE.
    */
    static let performUpdate = RaytracingAccelerationStructureBuildFalgs(rawValue: WinSDK.D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PERFORM_UPDATE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingAccelerationStructureBuildFalgs")
public typealias D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS = RaytracingAccelerationStructureBuildFalgs

public extension RaytracingAccelerationStructureBuildFalgs {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_NONE: RaytracingAccelerationStructureBuildFalgs = []

    @available(*, deprecated, renamed: "allowUpdates")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_UPDATE = Self.allowUpdates

    @available(*, deprecated, renamed: "allowCompaction")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_ALLOW_COMPACTION = Self.allowCompaction

    @available(*, deprecated, renamed: "preferFastTrace")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_TRACE = Self.preferFastTrace

    @available(*, deprecated, renamed: "preferFastBuild")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PREFER_FAST_BUILD = Self.preferFastBuild
 
    @available(*, deprecated, renamed: "minimizeMemory")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_MINIMIZE_MEMORY = Self.minimizeMemory
 
    @available(*, deprecated, renamed: "performUpdate")
    static let D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAG_PERFORM_UPDATE = Self.performUpdate
}

#endif
