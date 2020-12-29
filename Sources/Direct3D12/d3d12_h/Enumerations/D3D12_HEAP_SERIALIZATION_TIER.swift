/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify heap serialization support.
public enum SerializationTier {
    ///	Indicates that heap serialization is not supported.
    case notSupported
    ///	Indicates that heap serialization is supported. Your application can serialize resource data in heaps through copying APIs such as CopyResource, without necessarily requiring an explicit state transition of resources on those heaps.
    case supported

    internal var rawValue: _d3d12.D3D12_HEAP_SERIALIZATION_TIER {
        switch self {
        case .notSupported:
            return _d3d12.D3D12_HEAP_SERIALIZATION_TIER_0
        case .supported:
            return _d3d12.D3D12_HEAP_SERIALIZATION_TIER_10
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "SerializationTier")
public typealias D3D12_HEAP_SERIALIZATION_TIER = SerializationTier

public extension SerializationTier  {
    @available(*, deprecated, renamed: "notSupported")
    static let D3D12_HEAP_SERIALIZATION_TIER_0 = Self.notSupported

    @available(*, deprecated, renamed: "supported")
    static let D3D12_HEAP_SERIALIZATION_TIER_10 = Self.supported
}

#endif
