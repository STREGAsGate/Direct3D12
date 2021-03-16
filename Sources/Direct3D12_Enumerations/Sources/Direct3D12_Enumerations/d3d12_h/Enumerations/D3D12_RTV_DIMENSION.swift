/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

///Identifies the type of resource to view as a render target.
public enum RenderTargetViewDiemension {
///	Do not use this value, as it will cause ID3D12Device::CreateRenderTargetView to fail.
case unknown
///	The resource will be accessed as a buffer.
case buffer
///	The resource will be accessed as a 1D texture.
case texture1D
///	The resource will be accessed as an array of 1D textures.
case texture1dArray
///	The resource will be accessed as a 2D texture.
case texture2D
///	The resource will be accessed as an array of 2D textures.
case texture2dArray
///	The resource will be accessed as a 2D texture with multisampling.
case texture2dMultisampling
///	The resource will be accessed as an array of 2D textures with multisampling.
case texture2dArrayMultisampling
///	The resource will be accessed as a 3D texture.
case texture3D

    internal var rawValue: WinSDK.D3D12_RTV_DIMENSION {
        switch self {
        case .unknown:
            return WinSDK.D3D12_RTV_DIMENSION_UNKNOWN
        case .buffer:
            return WinSDK.D3D12_RTV_DIMENSION_BUFFER
        case .texture1D:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE1D
        case .texture1dArray:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE1DARRAY
        case .texture2D:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE2D
        case .texture2dArray:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE2DARRAY
        case .texture2dMultisampling:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE2DMS
        case .texture2dArrayMultisampling:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE2DMSARRAY
        case .texture3D:
            return WinSDK.D3D12_RTV_DIMENSION_TEXTURE3D
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderTargetViewDiemension")
public typealias D3D12_RTV_DIMENSION = RenderTargetViewDiemension

public extension RenderTargetViewDiemension  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_RTV_DIMENSION_UNKNOWN = Self.unknown

    @available(*, deprecated, renamed: "buffer")
    static let D3D12_RTV_DIMENSION_BUFFER = Self.buffer
    
    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_RTV_DIMENSION_TEXTURE1D = Self.texture1D
    
    @available(*, deprecated, renamed: "texture1dArray")
    static let D3D12_RTV_DIMENSION_TEXTURE1DARRAY = Self.texture1dArray
    
    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_RTV_DIMENSION_TEXTURE2D = Self.texture2D
    
    @available(*, deprecated, renamed: "texture2dArray")
    static let D3D12_RTV_DIMENSION_TEXTURE2DARRAY = Self.texture2dArray
    
    @available(*, deprecated, renamed: "texture2dMultisampling")
    static let D3D12_RTV_DIMENSION_TEXTURE2DMS = Self.texture2dMultisampling
    
    @available(*, deprecated, renamed: "texture2dArrayMultisampling")
    static let D3D12_RTV_DIMENSION_TEXTURE2DMSARRAY = Self.texture2dArrayMultisampling
    
    @available(*, deprecated, renamed: "texture3D")
    static let D3D12_RTV_DIMENSION_TEXTURE3D = Self.texture3D
}

#endif
