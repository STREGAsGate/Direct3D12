/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes the descriptor heap.
public struct D3DDescriptorHeapDescription {
    public typealias RawValue = WinSDK.D3D12_DESCRIPTOR_HEAP_DESC
    internal var rawValue: RawValue

    /// A D3D12_DESCRIPTOR_HEAP_TYPE-typed value that specifies the types of descriptors in the heap.
    public var `type`: D3DDescriptorHeapType {
        get {
            return D3DDescriptorHeapType(rawValue.Type)
        }
        set {
            rawValue.Type = newValue.rawValue
        }
    } 
    
    /// The number of descriptors in the heap.
    public var descriptorCount: UInt32 {
        get {
            return rawValue.NumDescriptors
        }
        set {
            rawValue.NumDescriptors = newValue
        }
    }

    /// A combination of D3D12_DESCRIPTOR_HEAP_FLAGS-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the heap.
    public var flags: D3DDescriptorHeapFlags {
        get {
            return D3DDescriptorHeapFlags(rawValue.Flags)
        }
        set {
            rawValue.Flags = newValue.rawType
        }
    }

    /// For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to Multi-adapter systems.
    public var multipleAdapterNodeMask: UInt32 {
        get {
            return self.rawValue.NodeMask
        }
        set {
            self.rawValue.NodeMask = newValue
        }
    }

    /** Describes the descriptor heap.
    - parameter type: A D3D12_DESCRIPTOR_HEAP_TYPE-typed value that specifies the types of descriptors in the heap.
    - parameter count: The number of descriptors in the heap.
    - parameter flags: A combination of D3D12_DESCRIPTOR_HEAP_FLAGS-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the heap.
    - parameter multipleAdapterNodeMask: For single-adapter operation, set this to zero. If there are multiple adapter nodes, set a bit to identify the node (one of the device's physical adapters) to which the descriptor heap applies. Each bit in the mask corresponds to a single node. Only one bit must be set. See Multi-adapter systems.
    */
    public init(type: D3DDescriptorHeapType, count: UInt32, flags: D3DDescriptorHeapFlags, multipleAdapterNodeMask: UInt32 = 0) {
        self.rawValue = RawValue()
        self.type = type
        self.descriptorCount = count
        self.flags = flags
        self.multipleAdapterNodeMask = multipleAdapterNodeMask
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDescriptorHeapDescription")
public typealias D3D12_DESCRIPTOR_HEAP_DESC = D3DDescriptorHeapDescription

#endif
