/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies options for working with resources.
public struct ResourceFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options are specified.
    //static let none = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_NONE.rawValue)

    /**
    Allows a render target view to be created for the resource, as well as enables the resource to transition into the state of D3D12_RESOURCE_STATE_RENDER_TARGET. Some adapter architectures allocate extra memory for textures with this flag to reduce the effective bandwidth during common rendering. This characteristic may not be beneficial for textures that are never rendered to, nor is it available for textures compressed with BC formats. Applications should avoid setting this flag when rendering will never occur.


    The following restrictions and interactions apply:


    Either the texture format must support render target capabilities at the current feature level. Or, when the format is a typeless format, a format within the same typeless group must support render target capabilities at the current feature level.

    Cannot be set in conjunction with textures that have D3D12_TEXTURE_LAYOUT_ROW_MAJOR when D3D12_FEATURE_DATAWinSDK_OPTIONS::CrossAdapterRowMajorTextureSupported is FALSE nor in conjunction with textures that have D3D12_TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE when D3D12_FEATURE_DATAWinSDK_OPTIONS::StandardSwizzle64KBSupported is FALSE.

    Cannot be used with 4KB alignment, D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL, nor usage with heaps that have D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES.
    */
    static let allowRenderTarget = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET.rawValue)
    /**
    Allows a depth stencil view to be created for the resource, as well as enables the resource to transition into the state of D3D12_RESOURCE_STATE_DEPTH_WRITE and/or D3D12_RESOURCE_STATE_DEPTH_READ. Most adapter architectures allocate extra memory for textures with this flag to reduce the effective bandwidth and maximize optimizations for early depth-test. Applications should avoid setting this flag when depth operations will never occur.


    The following restrictions and interactions apply:


    Either the texture format must support depth stencil capabilities at the current feature level. Or, when the format is a typeless format, a format within the same typeless group must support depth stencil capabilities at the current feature level.

    Cannot be used with D3D12_RESOURCE_DIMENSION_BUFFER, 4KB alignment, D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET, D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS, D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS, D3D12_TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE, D3D12_TEXTURE_LAYOUT_ROW_MAJOR, nor used with heaps that have D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES or D3D12_HEAP_FLAG_ALLOW_DISPLAY.

    Precludes usage of WriteToSubresource and ReadFromSubresource.

    Precludes GPU copying of a subregion. CopyTextureRegion must copy a whole subresource to or from resources with this flag.
    */
    static let allowDepthStencil = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL.rawValue)
    /**
    Allows an unordered access view to be created for the resource, as well as enables the resource to transition into the state of D3D12_RESOURCE_STATE_UNORDERED_ACCESS. Some adapter architectures must resort to less efficient texture layouts in order to provide this functionality. If a texture is rarely used for unordered access, it may be worth having two textures around and copying between them. One texture would have this flag, while the other wouldn't. Applications should avoid setting this flag when unordered access operations will never occur.


    The following restrictions and interactions apply:


    Either the texture format must support unordered access capabilities at the current feature level. Or, when the format is a typeless format, a format within the same typeless group must support unordered access capabilities at the current feature level.

    Cannot be set in conjunction with textures that have D3D12_TEXTURE_LAYOUT_ROW_MAJOR when D3D12_FEATURE_DATAWinSDK_OPTIONS::CrossAdapterRowMajorTextureSupported is FALSE nor in conjunction with textures that have D3D12_TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE when D3D12_FEATURE_DATAWinSDK_OPTIONS::StandardSwizzle64KBSupported is FALSE, nor when the feature level is less than 11.0.

    Cannot be used with MSAA textures.
    */
    static let allowUnorderedAccess = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS.rawValue)
    /**
    Disallows a shader resource view to be created for the resource, as well as disables the resource to transition into the state of D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE or D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE. Some adapter architectures experience increased bandwidth for depth stencil textures when shader resource views are precluded. If a texture is rarely used for shader resource, it may be worth having two textures around and copying between them. One texture would have this flag and the other wouldn't. Applications should set this flag when depth stencil textures will never be used from shader resource views.


    The following restrictions and interactions apply:



    Must be used with D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL.
    */
    static let denyShaderResource = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE.rawValue)
    /**
    Allows the resource to be used for cross-adapter data, as well as the same features enabled by ALLOW_SIMULTANEOUS_ACCESS. Cross adapter resources commonly preclude techniques that reduce effective texture bandwidth during usage, and some adapter architectures may require different caching behavior. Applications should avoid setting this flag when the resource data will never be used with another adapter.

    The following restrictions and interactions apply:



    Must be used with heaps that have D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER.

    Cannot be used with heaps that have D3D12_HEAP_FLAG_ALLOW_DISPLAY.
    */
    static let allowCrossAdapter = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER.rawValue)
    /**
    Allows a resource to be simultaneously accessed by multiple different queues, devices or processes (for example, allows a resource to be used with ResourceBarrier transitions performed in more than one command list
    executing at the same time).

    Simultaneous access allows multiple readers and one writer, as long as the writer doesn't concurrently modify the texels that other readers are accessing. Some adapter architectures cannot leverage techniques to reduce effective texture bandwidth during usage.

    However, applications should avoid setting this flag when multiple readers are not required during frequent, non-overlapping writes to textures. Use of this flag can compromise resource fences to perform waits, and prevents any compression being used with a resource.

    These restrictions and interactions apply.

    - Can't be used with D3D12_RESOURCE_DIMENSION_BUFFER; but buffers always have the properties represented by this flag.
    - Can't be used with MSAA textures.
    - Can't be used with D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL.
    */
    static let allowSimultaneousAccess = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS.rawValue)
    /**
    This resource may only be used as a decode reference frame. It may only be written to or read by the video decode operation.

    D3D12_VIDEO_DECODE_TIER_1 and D3D12_VIDEO_DECODE_TIER_2 may report D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED in the D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT structure configuration flag. If so, the application must allocate reference frames with the new D3D12_RESOURCE_VIDEO_DECODE_REFERENCE_ONLY resource flag. D3D12_VIDEO_DECODE_TIER_3 must not set the [D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED]
    (../d3d12video/ne-d3d12video-d3d12_video_decode_configuration_flags)) configuration flag and must not require the use of this resource flag.
    */
    static let videoDecodeReferenceOnly = ResourceFlags(rawValue: WinSDK.D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceFlags")
public typealias D3D12_RESOURCE_FLAGS = ResourceFlags

public extension ResourceFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_RESOURCE_FLAG_NONE: ResourceFlags = []

    @available(*, deprecated, renamed: "allowRenderTarget")
    static let D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET = Self.allowRenderTarget

    @available(*, deprecated, renamed: "allowDepthStencil")
    static let D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL = Self.allowDepthStencil

    @available(*, deprecated, renamed: "allowUnorderedAccess")
    static let D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS = Self.allowUnorderedAccess

    @available(*, deprecated, renamed: "denyShaderResource")
    static let D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE = Self.denyShaderResource

    @available(*, deprecated, renamed: "allowCrossAdapter")
    static let D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER = Self.allowCrossAdapter

    @available(*, deprecated, renamed: "allowSimultaneousAccess")
    static let D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS = Self.allowSimultaneousAccess

    @available(*, deprecated, renamed: "videoDecodeReferenceOnly")
    static let D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY = Self.videoDecodeReferenceOnly
}

#endif
