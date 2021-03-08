/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Flags passed to the TraceRay function to override transparency, culling, and early-out behavior.
public struct RayFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options selected.
    //static let none = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_NONE.rawValue)

    ///	All ray-primitive intersections encountered in a raytrace are treated as opaque. So no any hit shaders will be executed regardless of whether or not the hit geometry specifies D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE, and regardless of the instance flags on the instance that was hit.
    ///
    /// This flag is mutually exclusive with RAY_FLAG_FORCE_NON_OPAQUE, RAY_FLAG_CULL_OPAQUE and RAY_FLAG_CULL_NON_OPAQUE.
    static let forceOpaque = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_FORCE_OPAQUE.rawValue)
    ///	All ray-primitive intersections encountered in a raytrace are treated as non-opaque. So any hit shaders, if present, will be executed regardless of whether or not the hit geometry specifies D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE, and regardless of the instance flags on the instance that was hit. This flag is mutually exclusive with RAY_FLAG_FORCE_\OPAQUE, RAY_FLAG_CULL_OPAQUE and RAY_FLAG_CULL_NON_OPAQUE.
    static let forceNonOpaque = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_FORCE_NON_OPAQUE.rawValue)
    ///	The first ray-primitive intersection encountered in a raytrace automatically causes AcceptHitAndEndSearch to be called immediately after the any hit shader, including if there is no any hit shader.
    ///
    /// The only exception is when the preceding any hit shader calls IgnoreHit, in which case the ray continues unaffected such that the next hit becomes another candidate to be the first hit. For this exception to apply, the any hit shader has to actually be executed. So if the any hit shader is skipped because the hit is treated as opaque (e.g. due to RAY_FLAG_FORCE_OPAQUE or D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE or D3D12_RAYTRACING_INSTANCE_FLAG_OPAQUE being set), then AcceptHitAndEndSearch is called.
    ///
    /// If a closest hit shader is present at the first hit, it gets invoked unless RAY_FLAG_SKIP_CLOSEST_HIT_SHADER is also present. The one hit that was found is considered “closest”, even though other potential hits that might be closer on the ray may not have been visited.
    ///
    /// A typical use for this flag is for shadows, where only a single hit needs to be found.
    static let acceptFirstHitAndEndSearch = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_ACCEPT_FIRST_HIT_AND_END_SEARCH.rawValue)
    ///	Even if at least one hit has been committed, and the hit group for the closest hit contains a closest hit shader, skip execution of that shader.
    static let skipClosestHitShader = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_SKIP_CLOSEST_HIT_SHADER.rawValue)
    ///	Enables culling of back facing triangles. See D3D12_RAYTRACING_INSTANCE_FLAGS for selecting which triangles are back facing, per-instance.
    ///
    /// On instances that specify D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_CULL_DISABLE, this flag has no effect.
    ///
    /// On geometry types other than D3D12_RAYTRACING_GEOMETRY_TYPE_TRIANGLES, this flag has no effect.
    ///
    /// This flag is mutually exclusive with RAY_FLAG_CULL_FRONT_FACING_TRIANGLES.
    static let cullBackFacingTriangles = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_CULL_BACK_FACING_TRIANGLES.rawValue)
    ///	Enables culling of front facing triangles. See D3D12_RAYTRACING_INSTANCE_FLAGS for selecting which triangles are back facing, per-instance.
    ///
    /// On instances that specify D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_CULL_DISABLE, this flag has no effect.
    ///
    /// On geometry types other than D3D12_RAYTRACING_GEOMETRY_TYPE_TRIANGLES, this flag has no effect.
    ///
    /// This flag is mutually exclusive with RAY_FLAG_CULL_FRONT_FACING_TRIANGLES.
    static let cullFrontFacingTriangles = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_CULL_FRONT_FACING_TRIANGLES.rawValue)
    ///	Culls all primitives that are considered opaque based on their geometry and instance flags.
    ///
    /// This flag is mutually exclusive with RAY_FLAG_FORCE_OPAQUE, RAY_FLAG_FORCE_NON_OPAQUE, and RAY_FLAG_CULL_NON_OPAQUE.
    static let cullOpaque = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_CULL_OPAQUE.rawValue)
    ///	Culls all primitives that are considered non-opaque based on their geometry and instance flags.
    ///
    /// This flag is mutually exclusive with RAY_FLAG_FORCE_OPAQUE, RAY_FLAG_FORCE_NON_OPAQUE, and RAY_FLAG_CULL_OPAQUE.
    static let cullNonOpaque = RayFlags(rawValue: WinSDK.D3D12_RAY_FLAG_CULL_NON_OPAQUE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RayFlags")
public typealias D3D12_RAY_FLAGS = RayFlags

public extension RayFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RAY_FLAG_NONE: RayFlags = []

    @available(*, deprecated, renamed: "forceOpaque")
    static let D3D12_RAY_FLAG_FORCE_OPAQUE = Self.forceOpaque

    @available(*, deprecated, renamed: "forceNonOpaque")
    static let D3D12_RAY_FLAG_FORCE_NON_OPAQUE = Self.forceNonOpaque

    @available(*, deprecated, renamed: "acceptFirstHitAndEndSearch")
    static let D3D12_RAY_FLAG_ACCEPT_FIRST_HIT_AND_END_SEARCH = Self.acceptFirstHitAndEndSearch

    @available(*, deprecated, renamed: "skipClosestHitShader")
    static let D3D12_RAY_FLAG_SKIP_CLOSEST_HIT_SHADER = Self.skipClosestHitShader

    @available(*, deprecated, renamed: "cullBackFacingTriangles")
    static let D3D12_RAY_FLAG_CULL_BACK_FACING_TRIANGLES = Self.cullBackFacingTriangles

    @available(*, deprecated, renamed: "cullFrontFacingTriangles")
    static let D3D12_RAY_FLAG_CULL_FRONT_FACING_TRIANGLES = Self.cullFrontFacingTriangles

    @available(*, deprecated, renamed: "cullOpaque")
    static let D3D12_RAY_FLAG_CULL_OPAQUE = Self.cullOpaque

    @available(*, deprecated, renamed: "cullNonOpaque")
    static let D3D12_RAY_FLAG_CULL_NON_OPAQUE = Self.cullNonOpaque
}

#endif
