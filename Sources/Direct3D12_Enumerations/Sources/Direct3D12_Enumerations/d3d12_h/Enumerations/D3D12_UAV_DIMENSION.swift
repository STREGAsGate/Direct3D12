/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies unordered-access view options.
public enum UnorderedAccesssViewDimension {
    ///	The view type is unknown.
    case unknown
    ///	View the resource as a buffer.
    case buffer
    ///	View the resource as a 1D texture.
    case texture1D
    ///	View the resource as a 1D texture array.
    case texture1dArray
    ///	View the resource as a 2D texture.
    case texture2D
    ///	View the resource as a 2D texture array.
    case texture2dArray
    ///	View the resource as a 3D texture array.
    case texture3D

    internal var rawValue: WinSDK.D3D12_UAV_DIMENSION {
        switch self {
        case .unknown:
            return WinSDK.D3D12_UAV_DIMENSION_UNKNOWN
        case .buffer:
            return WinSDK.D3D12_UAV_DIMENSION_BUFFER
        case .texture1D:
            return WinSDK.D3D12_UAV_DIMENSION_TEXTURE1D
        case .texture1dArray:
            return WinSDK.D3D12_UAV_DIMENSION_TEXTURE1DARRAY
        case .texture2D:
            return WinSDK.D3D12_UAV_DIMENSION_TEXTURE2D
        case .texture2dArray:
            return WinSDK.D3D12_UAV_DIMENSION_TEXTURE2DARRAY
        case .texture3D:
            return WinSDK.D3D12_UAV_DIMENSION_TEXTURE3D
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "UnorderedAccesssViewDimension")
public typealias D3D12_UAV_DIMENSION = UnorderedAccesssViewDimension

public extension UnorderedAccesssViewDimension  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_UAV_DIMENSION_UNKNOWN = Self.unknown
    
    @available(*, deprecated, renamed: "buffer")
    static let D3D12_UAV_DIMENSION_BUFFER = Self.buffer
    
    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_UAV_DIMENSION_TEXTURE1D = Self.texture1D
    
    @available(*, deprecated, renamed: "texture1dArray")
    static let D3D12_UAV_DIMENSION_TEXTURE1DARRAY = Self.texture1dArray
    
    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_UAV_DIMENSION_TEXTURE2D = Self.texture2D
    
    @available(*, deprecated, renamed: "texture2dArray")
    static let D3D12_UAV_DIMENSION_TEXTURE2DARRAY = Self.texture2dArray
    
    @available(*, deprecated, renamed: "texture3D")
    static let D3D12_UAV_DIMENSION_TEXTURE3D = Self.texture3D
}

#endif
