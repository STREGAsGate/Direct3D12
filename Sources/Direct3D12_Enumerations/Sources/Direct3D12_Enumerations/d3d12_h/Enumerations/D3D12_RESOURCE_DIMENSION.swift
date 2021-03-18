/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies the type of resource being used.
public enum ResourceDimension {
    ///	Resource is of unknown type.
    case unknown
    ///	Resource is a buffer.
    case buffer
    ///	Resource is a 1D texture.
    case texture1D
    ///	Resource is a 2D texture.
    case texture2D
    ///	Resource is a 3D texture.
    case texture3D

    internal var rawValue: WinSDK.D3D12_RESOURCE_DIMENSION {
        switch self {
        case .unknown:
            return WinSDK.D3D12_RESOURCE_DIMENSION_UNKNOWN
        case .buffer:
            return WinSDK.D3D12_RESOURCE_DIMENSION_BUFFER
        case .texture1D:
            return WinSDK.D3D12_RESOURCE_DIMENSION_TEXTURE1D
        case .texture2D:
            return WinSDK.D3D12_RESOURCE_DIMENSION_TEXTURE2D
        case .texture3D:
            return WinSDK.D3D12_RESOURCE_DIMENSION_TEXTURE3D
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceDimension")
public typealias D3D12_RESOURCE_DIMENSION = ResourceDimension

public extension ResourceDimension  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_RESOURCE_DIMENSION_UNKNOWN = Self.unknown

    @available(*, deprecated, renamed: "buffer")
    static let D3D12_RESOURCE_DIMENSION_BUFFER = Self.buffer

    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_RESOURCE_DIMENSION_TEXTURE1D = Self.texture1D

    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_RESOURCE_DIMENSION_TEXTURE2D = Self.texture2D

    @available(*, deprecated, renamed: "texture3D")
    static let D3D12_RESOURCE_DIMENSION_TEXTURE3D = Self.texture3D
}

#endif
