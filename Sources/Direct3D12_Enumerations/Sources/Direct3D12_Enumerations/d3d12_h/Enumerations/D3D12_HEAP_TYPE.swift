/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of heap. When resident, heaps reside in a particular physical memory pool with certain CPU cache properties.
public enum HeapType {
    /**	Specifies the default heap.
    This heap type experiences the most bandwidth for the GPU, but cannot provide CPU access.
    The GPU can read and write to the memory from this pool, and resource transition barriers may be changed.
    The majority of heaps and resources are expected to be located here, and are typically populated through resources in upload heaps.
    */
    case `default`
    /**
    Specifies a heap used for uploading.
    This heap type has CPU access optimized for uploading to the GPU, but does not experience the maximum amount of bandwidth for the GPU.
    This heap type is best for CPU-write-once, GPU-read-once data; but GPU-read-once is stricter than necessary.
    GPU-read-once-or-from-cache is an acceptable use-case for the data; but such usages are hard to judge due to differing GPU cache designs and sizes.
    If in doubt, stick to the GPU-read-once definition or profile the difference on many GPUs between copying the data to a _DEFAULT heap vs. reading the data from an _UPLOAD heap.

    Resources in this heap must be created with D3D12_RESOURCE_STATE_GENERIC_READ and cannot be changed away from this.
    The CPU address for such heaps is commonly not efficient for CPU reads.

    The following are typical usages for _UPLOAD heaps:
    * Initializing resources in a _DEFAULT heap with data from the CPU.
    * Uploading dynamic data in a constant buffer that is read, repeatedly, by each vertex or pixel.

    The following are likely not good usages for _UPLOAD heaps:
    * Re-initializing the contents of a resource every frame.
    * Uploading constant data which is only used every other Draw call, where each Draw uses a non-trivial amount of other data.
    */
    case upload
    /**
    Specifies a heap used for reading back.
    This heap type has CPU access optimized for reading data back from the GPU, but does not experience the maximum amount of bandwidth for the GPU.
    This heap type is best for GPU-write-once, CPU-readable data.
    The CPU cache behavior is write-back, which is conducive for multiple sub-cache-line CPU reads.

    Resources in this heap must be created with D3D12_RESOURCE_STATE_COPY_DEST, and cannot be changed away from this.
    */
    case readBack
    /**
    Specifies a custom heap.
    The application may specify the memory pool and CPU cache properties directly, which can be useful for UMA optimizations, multi-engine, multi-adapter, or other special cases.
    To do so, the application is expected to understand the adapter architecture to make the right choice.
    For more details, see D3D12_FEATURE_ARCHITECTURE, D3D12_FEATURE_DATA_ARCHITECTURE, and GetCustomHeapProperties.
    */
    case custom

    internal var rawValue: WinSDK.D3D12_HEAP_TYPE {
        switch self {
    case .default:
        return WinSDK.D3D12_HEAP_TYPE_DEFAULT
    case .upload:
        return WinSDK.D3D12_HEAP_TYPE_UPLOAD
    case .readBack:
        return WinSDK.D3D12_HEAP_TYPE_READBACK
    case .custom:
        return WinSDK.D3D12_HEAP_TYPE_CUSTOM
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "HeapType")
public typealias D3D12_HEAP_TYPE = HeapType

public extension HeapType  {
    @available(*, deprecated, renamed: "default")
    static let D3D12_HEAP_TYPE_DEFAULT = Self.default

    @available(*, deprecated, renamed: "upload")
    static let D3D12_HEAP_TYPE_UPLOAD = Self.upload

    @available(*, deprecated, renamed: "readBack")
    static let D3D12_HEAP_TYPE_READBACK = Self.readBack

    @available(*, deprecated, renamed: "custom")
    static let D3D12_HEAP_TYPE_CUSTOM = Self.custom
}

#endif
