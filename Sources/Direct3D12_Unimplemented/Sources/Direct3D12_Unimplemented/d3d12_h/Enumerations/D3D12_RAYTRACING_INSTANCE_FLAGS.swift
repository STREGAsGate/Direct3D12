/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Flags for a raytracing acceleration structure instance. These flags can be used to override D3D12_RAYTRACING_GEOMETRY_FLAGS for individual instances.
public struct RaytracingInstanceFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options specified.
    //public static let none = RaytracingInstanceFlags(rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_FLAG_NONE.rawValue)

    ///	Disables front/back face culling for this instance. The Ray flags RAY_FLAG_CULL_BACK_FACING_TRIANGLES and RAY_FLAG_CULL_FRONT_FACING_TRIANGLES will have no effect on this instance.
    public static let triangleCullDisable = RaytracingInstanceFlags(rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_CULL_DISABLE.rawValue)
    ///	This flag reverses front and back facings, which is useful if the application’s natural winding order differs from the default. By default, a triangle is front facing if its vertices appear clockwise from the ray origin and back facing if its vertices appear counter-clockwise from the ray origin, in object space in a left-handed coordinate system.
    ///
    /// Since these winding direction rules are defined in object space, they are unaffected by instance transforms. For example, an instance transform matrix with negative determinant (e.g. mirroring some geometry) does not change the facing of the triangles within the instance. Per-geometry transforms defined in D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC , by contrast, get combined with the associated vertex data in object space, so a negative determinant matrix there does flip triangle winding.
    public static let triangleFrontCounterClockwise = RaytracingInstanceFlags(rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_FRONT_COUNTERCLOCKWISE.rawValue)
    ///	The instance will act as if D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE had been specified for all the geometries in the bottom-level acceleration structure referenced by the instance. Note that this behavior can be overridden by the ray flag RAY_FLAG_FORCE_NON_OPAQUE.
    ///
    ///This flag is mutually exclusive to the D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_NON_OPAQUE flag.
    public static let forceOpaque = RaytracingInstanceFlags(rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_OPAQUE.rawValue)
    ///	The instance will act as if D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE had not been specified for any of the geometries in the bottom-level acceleration structure referenced by the instance. Note that this behavior can be overridden by the ray flag RAY_FLAG_FORCE_OPAQUE.
    ///
    ///This flag is mutually exclusive to the D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_OPAQUE flag.
    public static let forceNonOpaque = RaytracingInstanceFlags(rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_NON_OPAQUE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingInstanceFlags")
public typealias D3D12_RAYTRACING_INSTANCE_FLAGS = RaytracingInstanceFlags

public extension RaytracingInstanceFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RAYTRACING_INSTANCE_FLAG_NONE: RaytracingInstanceFlags = []

    @available(*, deprecated, renamed: "triangleCullDisable")
    static let D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_CULL_DISABLE = Self.triangleCullDisable

    @available(*, deprecated, renamed: "triangleFrontCounterClockwise")
    static let D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_FRONT_COUNTERCLOCKWISE = Self.triangleFrontCounterClockwise

    @available(*, deprecated, renamed: "forceOpaque")
    static let D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_OPAQUE = Self.forceOpaque

    @available(*, deprecated, renamed: "forceNonOpaque")
    static let D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_NON_OPAQUE = Self.forceNonOpaque
}

#endif
