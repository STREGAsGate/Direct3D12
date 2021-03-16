/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies the type of resource that will be viewed as a shader resource.
public enum ShaderResourceViewDimension {
    ///	The type is unknown.
    case unknown
    ///	The resource is a buffer.
    case buffer
    ///	The resource is a 1D texture.
    case texture1D
    ///	The resource is an array of 1D textures.
    case texture1dArray
    ///	The resource is a 2D texture.
    case texture2D
    ///	The resource is an array of 2D textures.
    case texture2dArray
    ///	The resource is a multisampling 2D texture.
    case texture2dMultisampling
    ///	The resource is an array of multisampling 2D textures.
    case texture2dArrayMultisampling
    ///	The resource is a 3D texture.
    case texture3D
    ///	The resource is a cube texture.
    case textureCube
    ///	The resource is an array of cube textures.
    case textureCubeArray
    ///	The resource is a raytracing acceleration structure.
    case raytracingAccelerationStructure

    internal var rawValue: WinSDK.D3D12_SRV_DIMENSION {
        switch self {
        case .unknown:
            return WinSDK.D3D12_SRV_DIMENSION_UNKNOWN
        case .buffer:
            return WinSDK.D3D12_SRV_DIMENSION_BUFFER
        case .texture1D:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE1D
        case .texture1dArray:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE1DARRAY
        case .texture2D:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE2D
        case .texture2dArray:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE2DARRAY
        case .texture2dMultisampling:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE2DMS
        case .texture2dArrayMultisampling:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE2DMSARRAY
        case .texture3D:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURE3D
        case .textureCube:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURECUBE
        case .textureCubeArray:
            return WinSDK.D3D12_SRV_DIMENSION_TEXTURECUBEARRAY
        case .raytracingAccelerationStructure:
            return WinSDK.D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderResourceViewDimension")
public typealias D3D12_SRV_DIMENSION = ShaderResourceViewDimension

public extension ShaderResourceViewDimension  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_SRV_DIMENSION_UNKNOWN = Self.unknown
    
    @available(*, deprecated, renamed: "buffer")
    static let D3D12_SRV_DIMENSION_BUFFER = Self.buffer
    
    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_SRV_DIMENSION_TEXTURE1D = Self.texture1D
    
    @available(*, deprecated, renamed: "texture1dArray")
    static let D3D12_SRV_DIMENSION_TEXTURE1DARRAY = Self.texture1dArray
    
    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_SRV_DIMENSION_TEXTURE2D = Self.texture2D
    
    @available(*, deprecated, renamed: "texture2dArray")
    static let D3D12_SRV_DIMENSION_TEXTURE2DARRAY = Self.texture2dArray
    
    @available(*, deprecated, renamed: "texture2dMultisampling")
    static let D3D12_SRV_DIMENSION_TEXTURE2DMS = Self.texture2dMultisampling
    
    @available(*, deprecated, renamed: "texture2dArrayMultisampling")
    static let D3D12_SRV_DIMENSION_TEXTURE2DMSARRAY = Self.texture2dArrayMultisampling
    
    @available(*, deprecated, renamed: "texture3D")
    static let D3D12_SRV_DIMENSION_TEXTURE3D = Self.texture3D
    
    @available(*, deprecated, renamed: "textureCube")
    static let D3D12_SRV_DIMENSION_TEXTURECUBE = Self.textureCube
    
    @available(*, deprecated, renamed: "textureCubeArray")
    static let D3D12_SRV_DIMENSION_TEXTURECUBEARRAY = Self.textureCubeArray
    
    @available(*, deprecated, renamed: "raytracingAccelerationStructure")
    static let D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE = Self.raytracingAccelerationStructure
}

#endif
