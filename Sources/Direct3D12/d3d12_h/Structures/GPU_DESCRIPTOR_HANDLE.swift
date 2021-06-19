/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes a GPU descriptor handle.
public struct D3DGPUDescriptorHandle {
    public typealias RawValue = WinSDK.D3D12_GPU_DESCRIPTOR_HANDLE
    internal var rawValue: RawValue

    /// The address of the descriptor.
    public var pointer: UInt64 {
        get {
            return rawValue.ptr
        }
        set {
            self.rawValue.ptr = newValue
        }
    }

    /** Describes a GPU descriptor handle.
    - parameter pointer: The address of the descriptor.
    */
    public init(pointer: UInt64) {
        self.rawValue = RawValue()
        self.pointer = pointer
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DGPUDescriptorHandle")
public typealias D3D12_GPU_DESCRIPTOR_HANDLE = D3DGPUDescriptorHandle

#endif
