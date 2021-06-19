/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DConstantBufferViewDescription {
    public typealias RawValue = WinSDK.D3D12_CONSTANT_BUFFER_VIEW_DESC
    internal var rawValue: RawValue

    /// The D3D12_GPU_VIRTUAL_ADDRESS of the constant buffer. D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
    public var bufferLocation: D3DGPUVirtualAddress {
        get {
            return rawValue.BufferLocation
        }
        set {
            rawValue.BufferLocation = newValue
        }
    }

    /// The size in bytes of the constant buffer.
    public var bufferSize: UInt32 {
        get {
            return rawValue.SizeInBytes
        }
        set {
            rawValue.SizeInBytes = newValue
        }
    }

    /** Describes a constant buffer to view.
    - parameters location: The D3D12_GPU_VIRTUAL_ADDRESS of the constant buffer.
    - parameters size: The size in bytes of the constant buffer.
    */
    public init(location: D3DGPUVirtualAddress, size: UInt32) {
        self.rawValue = RawValue()
        self.bufferLocation = location
        self.bufferSize = size
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DConstantBufferViewDescription")
public typealias D3D12_CONSTANT_BUFFER_VIEW_DESC = D3DConstantBufferViewDescription 

#endif
