/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes a stream output buffer.
public struct D3DStreamOutputBufferView {
    public typealias RawValue = WinSDK.D3D12_STREAM_OUTPUT_BUFFER_VIEW
    internal var rawValue: RawValue

    /// A D3D12_GPU_VIRTUAL_ADDRESS (a UINT64) that points to the stream output buffer. If SizeInBytes is 0, this member isn't used and can be any value.
    public var bufferLocation: D3DGPUVirtualAddress {
        get {
            return rawValue.BufferLocation
        }
        set {
            rawValue.BufferLocation = newValue
        }
    }

    /// The size of the stream output buffer in bytes.
    public var byteCount: UInt64 {
        get {
            return rawValue.SizeInBytes
        }
        set {
            rawValue.SizeInBytes = newValue
        }
    }

    /// The location of the value of how much data has been filled into the buffer, as a D3D12_GPU_VIRTUAL_ADDRESS (a UINT64). This member can't be NULL; a filled size location must be supplied (which the hardware will increment as data is output). If SizeInBytes is 0, this member isn't used and can be any value.
    public var bufferFilledSizeLocation: D3DGPUVirtualAddress {
        get {
            return rawValue.BufferFilledSizeLocation
        }
        set {
            rawValue.BufferFilledSizeLocation = newValue
        }
    }

    /** Describes a stream output buffer.
    - parameter bufferLocation: A D3D12_GPU_VIRTUAL_ADDRESS (a UINT64) that points to the stream output buffer. If SizeInBytes is 0, this member isn't used and can be any value.
    - parameter byteCount: The size of the stream output buffer in bytes.
    - parameter bufferFilledSizeLocation: The location of the value of how much data has been filled into the buffer, as a D3D12_GPU_VIRTUAL_ADDRESS (a UINT64). This member can't be NULL; a filled size location must be supplied (which the hardware will increment as data is output). If SizeInBytes is 0, this member isn't used and can be any value.
    */
    public init(bufferLocation: D3DGPUVirtualAddress, byteCount: UInt64, bufferFilledSizeLocation: D3DGPUVirtualAddress) {
        self.rawValue = RawValue(BufferLocation: bufferLocation, SizeInBytes: byteCount, BufferFilledSizeLocation: bufferFilledSizeLocation)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DStreamOutputBufferView")
public typealias D3D12_STREAM_OUTPUT_BUFFER_VIEW = D3DStreamOutputBufferView

#endif