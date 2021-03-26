/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes a heap.
public struct D3DHeapDescription {
    public typealias RawValue = WinSDK.D3D12_HEAP_DESC
    internal var rawValue: RawValue

    /// The size, in bytes, of the heap. To avoid wasting memory, applications should pass SizeInBytes values which are multiples of the effective Alignment; but non-aligned SizeInBytes is also supported, for convenience. To find out how large a heap must be to support textures with undefined layouts and adapter-specific sizes, call ID3D12Device::GetResourceAllocationInfo.
    public var byteCount: UInt64 {
        get {
            return rawValue.SizeInBytes
        }
        set {
            rawValue.SizeInBytes = newValue
        }
    }

    /// A D3D12_HEAP_PROPERTIES structure that describes the heap properties.
    public var properties: D3DHeapProperties {
        get {
            return D3DHeapProperties(rawValue.Properties)
        }
        set {
            rawValue.Properties = newValue.rawValue
        }
    }

    /// The alignment value for the heap. Valid values:
    public var alignment: UInt64 {
        get {
            return rawValue.Alignment
        }
        set {
            rawValue.Alignment = newValue
        }
    }

    /// A combination of D3D12_HEAP_FLAGS-typed values that are combined by using a bitwise-OR operation. The resulting value identifies heap options. When creating heaps to support adapters with resource heap tier 1, an application must choose some flags.
    public var flags: D3DHeapFlags {
        get {
            return D3DHeapFlags(rawValue.Flags)
        }
        set {
            rawValue.Flags = newValue.rawType
        }
    }

    /** Describes a heap.
    - parameter byteCount: The size, in bytes, of the heap. To avoid wasting memory, applications should pass SizeInBytes values which are multiples of the effective Alignment; but non-aligned SizeInBytes is also supported, for convenience. To find out how large a heap must be to support textures with undefined layouts and adapter-specific sizes, call ID3D12Device::GetResourceAllocationInfo.
    - parameter properties: A D3D12_HEAP_PROPERTIES structure that describes the heap properties.
    - parameter alignment: The alignment value for the heap. Valid values:
    - parmaeter flags: A combination of D3D12_HEAP_FLAGS-typed values that are combined by using a bitwise-OR operation. The resulting value identifies heap options. When creating heaps to support adapters with resource heap tier 1, an application must choose some flags.
    */
    public init(byteCount: UInt64, properties: D3DHeapProperties, alignment: UInt64, flags: D3DHeapFlags) {
        self.rawValue = RawValue()
        self.byteCount = byteCount
        self.properties = properties
        self.alignment = alignment
        self.flags = flags
    }

    /// Describes a heap.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DHeapDescription")
public typealias D3D12_HEAP_DESC = D3DHeapDescription

#endif
