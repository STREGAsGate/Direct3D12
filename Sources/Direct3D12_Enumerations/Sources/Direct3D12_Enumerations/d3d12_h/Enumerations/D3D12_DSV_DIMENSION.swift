/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies how to access a resource used in a depth-stencil view.
public enum DsvDimension {
    ///	D3D12_DSV_DIMENSION_UNKNOWN is not a valid value for D3D12_DEPTH_STENCIL_VIEW_DESC and is not used.
    case unknown
    ///	The resource will be accessed as a 1D texture.
    case texture1D
    ///	The resource will be accessed as an array of 1D textures.
    case texture1DArray
    ///	The resource will be accessed as a 2D texture.
    case texture2D
    ///	The resource will be accessed as an array of 2D textures.
    case texture2DArray
    ///	The resource will be accessed as a 2D texture with multi sampling.
    case texture2DMuiliSampling
    ///	The resource will be accessed as an array of 2D textures with multi sampling.
    case texture2DMuiliSamplingArray

    internal var rawValue: WinSDK.D3D12_DSV_DIMENSION {
        switch self {
        case .unknown:
            return WinSDK.D3D12_DSV_DIMENSION_UNKNOWN
        case .texture1D:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE1D
        case .texture1DArray:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE1DARRAY
        case .texture2D:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE2D
        case .texture2DArray:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE2DARRAY
        case .texture2DMuiliSampling:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE2DMS
        case .texture2DMuiliSamplingArray:
            return WinSDK.D3D12_DSV_DIMENSION_TEXTURE2DMSARRAY
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DsvDimension")
public typealias D3D12_DSV_DIMENSION  = DsvDimension

public extension DsvDimension  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_DSV_DIMENSION_UNKNOWN = Self.unknown

    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_DSV_DIMENSION_TEXTURE1D = Self.texture1D

    @available(*, deprecated, renamed: "texture1DArray")
    static let D3D12_DSV_DIMENSION_TEXTURE1DARRAY = Self.texture1DArray

    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_DSV_DIMENSION_TEXTURE2D = Self.texture2D

    @available(*, deprecated, renamed: "texture2DArray")
    static let D3D12_DSV_DIMENSION_TEXTURE2DARRAY = Self.texture2DArray

    @available(*, deprecated, renamed: "texture2DMuiliSampling")
    static let D3D12_DSV_DIMENSION_TEXTURE2DMS = Self.texture2DMuiliSampling

    @available(*, deprecated, renamed: "texture2DMuiliSamplingArray")
    static let D3D12_DSV_DIMENSION_TEXTURE2DMSARRAY = Self.texture2DMuiliSamplingArray
}

#endif
