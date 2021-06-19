/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies flags for raytracing geometry in a D3D12_RAYTRACING_GEOMETRY_DESC structure.
public struct RaytracingGeometryFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// 	No options specified.
    //public static let none = RaytracingGeometryFlags(rawValue: WinSDK.D3D12_RAYTRACING_GEOMETRY_FLAG_NONE.rawValue)

    ///	When rays encounter this geometry, the geometry acts as if no any hit shader is present. It is recommended that apps use this flag liberally, as it can enable important ray-processing optimizations. Note that this behavior can be overridden on a per-instance basis with D3D12_RAYTRACING_INSTANCE_FLAGS and on a per-ray basis using ray flags in TraceRay.
    public static let opaque = RaytracingGeometryFlags(rawValue: WinSDK.D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE.rawValue)
    ///	By default, the system is free to trigger an any hit shader more than once for a given ray-primitive intersection. This flexibility helps improve the traversal efficiency of acceleration structures in certain cases. For instance, if the acceleration structure is implemented internally with bounding volumes, the implementation may find it beneficial to store relatively long triangles in multiple bounding boxes rather than a larger single box. However, some application use cases require that intersections be reported to the any hit shader at most once. This flag enables that guarantee for the given geometry, potentially with some performance impact.
    /// This flag applies to all geometry types.
    public static let noDuplicateAnyHitInvocation = RaytracingGeometryFlags(rawValue: WinSDK.D3D12_RAYTRACING_GEOMETRY_FLAG_NO_DUPLICATE_ANYHIT_INVOCATION.rawValue)
        
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingGeometryFlags")
public typealias D3D12_RAYTRACING_GEOMETRY_FLAGS = RaytracingGeometryFlags

public extension RaytracingGeometryFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RAYTRACING_GEOMETRY_FLAG_NONE: RaytracingGeometryFlags = []

    @available(*, deprecated, renamed: "opaque")
    static let D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE = Self.opaque

    @available(*, deprecated, renamed: "noDuplicateAnyHitInvocation")
    static let D3D12_RAYTRACING_GEOMETRY_FLAG_NO_DUPLICATE_ANYHIT_INVOCATION = Self.noDuplicateAnyHitInvocation       
}

#endif
