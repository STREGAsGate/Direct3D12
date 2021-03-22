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

    /// Specifies pointer that references the memory location of the cache.
    var cachedBlob: Data {
        get {
            return withUnsafeBytes(of:  self.rawValue.pCachedBlob) {pCachedBlob in
                return Data(pCachedBlob)
            }
        }
        set {
            newValue.withUnsafeBytes {pCachedBlob in
                self.rawValue.pCachedBlob = pCachedBlob.baseAddress!
            }
            self.rawValue.CachedBlobSizeInBytes = UInt64(newValue.count)
        }
    }

    /** Stores a pipeline state.
    - parameter cachedBlob: Specifies pointer that references the memory location of the cache.
    */
    public init(cachedBlob: Data) {
        self.rawValue = RawValue()
        self.cachedBlob = cachedBlob
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
