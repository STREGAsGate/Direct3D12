/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Foundation

/// Stores a pipeline state.
public struct D3DCachedPipelineState {
    public typealias RawValue = WinSDK.D3D12_CACHED_PIPELINE_STATE
    internal var rawValue: RawValue

    /** Stores a pipeline state.
    - parameter cachedBlob: Specifies pointer that references the memory location of the cache.
    */
    public init(cachedBlob: D3DBlob) {
        self.rawValue = RawValue()
        self.rawValue.pCachedBlob = UnsafeRawPointer(cachedBlob.bufferPointer)
        self.rawValue.CachedBlobSizeInBytes = cachedBlob.bufferSize
    }

    public init() {
        self.rawValue = RawValue(pCachedBlob: nil, CachedBlobSizeInBytes: 0)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DCachedPipelineState")
public typealias D3D12_CACHED_PIPELINE_STATE = D3DCachedPipelineState 

#endif
