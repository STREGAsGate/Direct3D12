/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies the shaders that can access the contents of a given root signature slot.
public enum ShaderVisibility {
    ///	Specifies that all shader stages can access whatever is bound at the root signature slot.
    case all
    ///	Specifies that the vertex shader stage can access whatever is bound at the root signature slot.
    case vertex
    ///	Specifies that the hull shader stage can access whatever is bound at the root signature slot.
    case hull
    ///	Specifies that the domain shader stage can access whatever is bound at the root signature slot.
    case domain
    ///	Specifies that the geometry shader stage can access whatever is bound at the root signature slot.
    case geometry
    ///	Specifies that the pixel shader stage can access whatever is bound at the root signature slot.
    case pixel
    ///	Specifies that the amplification shader stage can access whatever is bound at the root signature slot.
    case amplification
    ///	Specifies that the mesh shader stage can access whatever is bound at the root signature slot.
    case mesh
    
    internal var rawValue: WinSDK.D3D12_SHADER_VISIBILITY {
        switch self {
    case .all:
        return WinSDK.D3D12_SHADER_VISIBILITY_ALL
    case .vertex:
        return WinSDK.D3D12_SHADER_VISIBILITY_VERTEX
    case .hull:
        return WinSDK.D3D12_SHADER_VISIBILITY_HULL
    case .domain:
        return WinSDK.D3D12_SHADER_VISIBILITY_DOMAIN
    case .geometry:
        return WinSDK.D3D12_SHADER_VISIBILITY_GEOMETRY
    case .pixel:
        return WinSDK.D3D12_SHADER_VISIBILITY_PIXEL
    case .amplification:
        return WinSDK.D3D12_SHADER_VISIBILITY_AMPLIFICATION
    case .mesh:
        return WinSDK.D3D12_SHADER_VISIBILITY_MESH
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderVisibility")
public typealias D3D12_SHADER_VISIBILITY = ShaderVisibility

public extension ShaderVisibility  {
    @available(*, deprecated, renamed: "all")
    static let D3D12_SHADER_VISIBILITY_ALL = Self.all
    
    @available(*, deprecated, renamed: "vertex")
    static let D3D12_SHADER_VISIBILITY_VERTEX = Self.vertex
    
    @available(*, deprecated, renamed: "hull")
    static let D3D12_SHADER_VISIBILITY_HULL = Self.hull
    
    @available(*, deprecated, renamed: "domain")
    static let D3D12_SHADER_VISIBILITY_DOMAIN = Self.domain
    
    @available(*, deprecated, renamed: "geometry")
    static let D3D12_SHADER_VISIBILITY_GEOMETRY = Self.geometry
    
    @available(*, deprecated, renamed: "pixel")
    static let D3D12_SHADER_VISIBILITY_PIXEL = Self.pixel
    
    @available(*, deprecated, renamed: "amplification")
    static let D3D12_SHADER_VISIBILITY_AMPLIFICATION = Self.amplification
    
    @available(*, deprecated, renamed: "mesh")
    static let D3D12_SHADER_VISIBILITY_MESH = Self.mesh
}

#endif
