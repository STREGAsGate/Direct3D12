/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies heap options, such as whether the heap can contain textures, and whether resources are shared across adapters.
public struct HeapFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options are specified.
    //static let none = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_NONE.rawValue)

    ///	The heap is shared. Refer to Shared Heaps.
    static let shared = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_SHARED.rawValue)
    ///	The heap isn't allowed to contain buffers.
    static let denyBuffers = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_DENY_BUFFERS.rawValue)
    ///	The heap is allowed to contain swap-chain surfaces.
    static let allowDisplay = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_DISPLAY.rawValue)
    ///	The heap is allowed to share resources across adapters. Refer to Shared Heaps.
    static let sharedAcrossAdapter = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER.rawValue)
    ///	The heap is not allowed to store Render Target (RT) and/or Depth-Stencil (DS) textures.
    static let denyRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES.rawValue)
    ///	The heap is not allowed to contain resources with D3D12_RESOURCE_DIMENSION_TEXTURE1D, D3D12_RESOURCE_DIMENSION_TEXTURE2D, or D3D12_RESOURCE_DIMENSION_TEXTURE3D unless either D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET or D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL are present. Refer to D3D12_RESOURCE_DIMENSION and D3D12_RESOURCE_FLAGS.
    static let denyNonRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES.rawValue)
    ///	Unsupported. Do not use.
    static let hardwareProtected = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_HARDWARE_PROTECTED.rawValue)
    ///	The heap supports MEM_WRITE_WATCH functionality, which causes the system to track the pages that are written to in the commited memory region. This flag can't be combined with the D3D12_HEAP_TYPE_DEFAULT or D3D12_CPU_PAGE_PROPERTY_UNKNOWN flags. Applications are discouraged from using this flag themselves because it prevents tools from using this functionality.
    static let allowWriteWatch = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH.rawValue)
    /**	
    Ensures that atomic operations will be atomic on this heap's memory, according to components able to see the memory.

    Creating a heap with this flag will fail under either of these conditions.
    - The heap type is D3D12_HEAP_TYPE_DEFAULT, and the heap can be visible on multiple nodes, but the device does not support D3D12_CROSS_NODE_SHARING_TIER_3.
    - The heap is CPU-visible, but the heap type is not D3D12_HEAP_TYPE_CUSTOM.

    - Note: that heaps with this flag might be a limited resource on some systems.
    */
    static let allowShaderAtomics = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS.rawValue)
    ///	The heap is created in a non-resident state and must be made resident using ID3D12Device::MakeResident or ID3D12Device3::EnqueueMakeResident.
    /// By default, the final step of heap creation is to make the heap resident, so this flag skips this step and allows the application to decide when to do so.
    static let createNotResident = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT.rawValue)
    ///	Allows the OS to not zero the heap created. By default, committed resources and heaps are almost always zeroed upon creation. This flag allows this to be elided in some scenarios. However, it doesn't guarantee it. For example, memory coming from other processes still needs to be zeroed for data protection and process isolation. This can lower the overhead of creating the heap.
    static let createNotZeroed = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_CREATE_NOT_ZEROED.rawValue)
    ///	The heap is allowed to store all types of buffers and/or textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowAllBuffersAndTextures = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES.rawValue)
    ///	The heap is only allowed to store buffers. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyBuffers = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS.rawValue)
    ///	The heap is only allowed to store non-RT, non-DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyNonRenderTargetOrDepthStencilTextures = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES.rawValue)
    ///	The heap is only allowed to store RT and/or DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: _d3d12.D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "HeapFlags")
public typealias D3D12_HEAP_FLAGS = HeapFlags

public extension HeapFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_HEAP_FLAG_NONE: HeapFlags = []

    @available(*, deprecated, renamed: "shared")
    static let D3D12_HEAP_FLAG_SHARED = Self.shared

    @available(*, deprecated, renamed: "denyBuffers")
    static let D3D12_HEAP_FLAG_DENY_BUFFERS = Self.denyBuffers

    @available(*, deprecated, renamed: "allowDisplay")
    static let D3D12_HEAP_FLAG_ALLOW_DISPLAY = Self.allowDisplay

    @available(*, deprecated, renamed: "sharedAcrossAdapter")
    static let D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER = Self.sharedAcrossAdapter

    @available(*, deprecated, renamed: "denyRenderTargetAndDepthStencilTextures")
    static let D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES = Self.denyRenderTargetAndDepthStencilTextures

    @available(*, deprecated, renamed: "denyNonRenderTargetAndDepthStencilTextures")
    static let D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES = Self.denyNonRenderTargetAndDepthStencilTextures

    @available(*, deprecated, renamed: "hardwareProtected")
    static let D3D12_HEAP_FLAG_HARDWARE_PROTECTED = Self.hardwareProtected

    @available(*, deprecated, renamed: "allowWriteWatch")
    static let D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH = Self.allowWriteWatch

    @available(*, deprecated, renamed: "allowShaderAtomics")
    static let D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS = Self.allowShaderAtomics

    @available(*, deprecated, renamed: "createNotResident")
    static let D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT = Self.createNotResident

    @available(*, deprecated, renamed: "createNotZeroed")
    static let D3D12_HEAP_FLAG_CREATE_NOT_ZEROED = Self.createNotZeroed

    @available(*, deprecated, renamed: "allowAllBuffersAndTextures")
    static let D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES = Self.allowAllBuffersAndTextures

    @available(*, deprecated, renamed: "allowOnlyBuffers")
    static let D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS = Self.allowOnlyBuffers

    @available(*, deprecated, renamed: "allowOnlyNonRenderTargetOrDepthStencilTextures")
    static let D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES = Self.allowOnlyNonRenderTargetOrDepthStencilTextures

    @available(*, deprecated, renamed: "allowOnlyRenderTargetAndDepthStencilTextures")
    static let D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES = Self.allowOnlyRenderTargetAndDepthStencilTextures
}

#endif
