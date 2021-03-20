/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies heap options, such as whether the heap can contain textures, and whether resources are shared across adapters.
public struct HeapFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_HEAP_FLAGS
    public typealias RawValue = WinSDK.D3D12_HEAP_FLAGS.RawValue
    public let rawValue: RawValue
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options are specified.
    //static let none = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_NONE.rawValue)

    ///	The heap is shared. Refer to Shared Heaps.
    static let shared = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_SHARED.rawValue)
    ///	The heap isn't allowed to contain buffers.
    static let denyBuffers = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_DENY_BUFFERS.rawValue)
    ///	The heap is allowed to contain swap-chain surfaces.
    static let allowDisplay = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_DISPLAY.rawValue)
    ///	The heap is allowed to share resources across adapters. Refer to Shared Heaps.
    static let sharedAcrossAdapter = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER.rawValue)
    ///	The heap is not allowed to store Render Target (RT) and/or Depth-Stencil (DS) textures.
    static let denyRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES.rawValue)
    ///	The heap is not allowed to contain resources with D3D12_RESOURCE_DIMENSION_TEXTURE1D, D3D12_RESOURCE_DIMENSION_TEXTURE2D, or D3D12_RESOURCE_DIMENSION_TEXTURE3D unless either D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET or D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL are present. Refer to D3D12_RESOURCE_DIMENSION and D3D12_RESOURCE_FLAGS.
    static let denyNonRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES.rawValue)
    ///	Unsupported. Do not use.
    static let hardwareProtected = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_HARDWARE_PROTECTED.rawValue)
    ///	The heap supports MEM_WRITE_WATCH functionality, which causes the system to track the pages that are written to in the commited memory region. This flag can't be combined with the D3D12_HEAP_TYPE_DEFAULT or D3D12_CPU_PAGE_PROPERTY_UNKNOWN flags. Applications are discouraged from using this flag themselves because it prevents tools from using this functionality.
    static let allowWriteWatch = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH.rawValue)
    /**	
    Ensures that atomic operations will be atomic on this heap's memory, according to components able to see the memory.

    Creating a heap with this flag will fail under either of these conditions.
    - The heap type is D3D12_HEAP_TYPE_DEFAULT, and the heap can be visible on multiple nodes, but the device does not support D3D12_CROSS_NODE_SHARING_TIER_3.
    - The heap is CPU-visible, but the heap type is not D3D12_HEAP_TYPE_CUSTOM.

    - Note: that heaps with this flag might be a limited resource on some systems.
    */
    static let allowShaderAtomics = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS.rawValue)
    ///	The heap is created in a non-resident state and must be made resident using ID3D12Device::MakeResident or ID3D12Device3::EnqueueMakeResident.
    /// By default, the final step of heap creation is to make the heap resident, so this flag skips this step and allows the application to decide when to do so.
    static let createNotResident = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT.rawValue)
    ///	Allows the OS to not zero the heap created. By default, committed resources and heaps are almost always zeroed upon creation. This flag allows this to be elided in some scenarios. However, it doesn't guarantee it. For example, memory coming from other processes still needs to be zeroed for data protection and process isolation. This can lower the overhead of creating the heap.
    static let createNotZeroed = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_CREATE_NOT_ZEROED.rawValue)
    ///	The heap is allowed to store all types of buffers and/or textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowAllBuffersAndTextures = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES.rawValue)
    ///	The heap is only allowed to store buffers. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyBuffers = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS.rawValue)
    ///	The heap is only allowed to store non-RT, non-DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyNonRenderTargetOrDepthStencilTextures = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES.rawValue)
    ///	The heap is only allowed to store RT and/or DS textures. This is an alias; for more details, see "Aliases" in the Remarks section.
    static let allowOnlyRenderTargetAndDepthStencilTextures = HeapFlags(rawValue: WinSDK.D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES.rawValue)

    public init(rawValue: RawValue) {
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


@available(*, deprecated, message: "Use [] to represent none in Swift.")
public let D3D12_HEAP_FLAG_NONE: HeapFlags = []

@available(*, deprecated, renamed: "HeapFlags.shared")
public let D3D12_HEAP_FLAG_SHARED = HeapFlags.shared

@available(*, deprecated, renamed: "HeapFlags.denyBuffers")
public let D3D12_HEAP_FLAG_DENY_BUFFERS = HeapFlags.denyBuffers

@available(*, deprecated, renamed: "HeapFlags.allowDisplay")
public let D3D12_HEAP_FLAG_ALLOW_DISPLAY = HeapFlags.allowDisplay

@available(*, deprecated, renamed: "HeapFlags.sharedAcrossAdapter")
public let D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER = HeapFlags.sharedAcrossAdapter

@available(*, deprecated, renamed: "HeapFlags.denyRenderTargetAndDepthStencilTextures")
public let D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES = HeapFlags.denyRenderTargetAndDepthStencilTextures

@available(*, deprecated, renamed: "HeapFlags.denyNonRenderTargetAndDepthStencilTextures")
public let D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES = HeapFlags.denyNonRenderTargetAndDepthStencilTextures

@available(*, deprecated, renamed: "HeapFlags.hardwareProtected")
public let D3D12_HEAP_FLAG_HARDWARE_PROTECTED = HeapFlags.hardwareProtected

@available(*, deprecated, renamed: "HeapFlags.allowWriteWatch")
public let D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH = HeapFlags.allowWriteWatch

@available(*, deprecated, renamed: "HeapFlags.allowShaderAtomics")
public let D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS = HeapFlags.allowShaderAtomics

@available(*, deprecated, renamed: "HeapFlags.createNotResident")
public let D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT = HeapFlags.createNotResident

@available(*, deprecated, renamed: "HeapFlags.createNotZeroed")
public let D3D12_HEAP_FLAG_CREATE_NOT_ZEROED = HeapFlags.createNotZeroed

@available(*, deprecated, renamed: "HeapFlags.allowAllBuffersAndTextures")
public let D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES = HeapFlags.allowAllBuffersAndTextures

@available(*, deprecated, renamed: "HeapFlags.allowOnlyBuffers")
public let D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS = HeapFlags.allowOnlyBuffers

@available(*, deprecated, renamed: "HeapFlags.allowOnlyNonRenderTargetOrDepthStencilTextures")
public let D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES = HeapFlags.allowOnlyNonRenderTargetOrDepthStencilTextures

@available(*, deprecated, renamed: "HeapFlags.allowOnlyRenderTargetAndDepthStencilTextures")
public let D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES = HeapFlags.allowOnlyRenderTargetAndDepthStencilTextures

#endif
