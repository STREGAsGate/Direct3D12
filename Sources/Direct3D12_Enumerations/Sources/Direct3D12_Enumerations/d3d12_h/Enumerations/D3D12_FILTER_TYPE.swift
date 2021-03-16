/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of magnification or minification sampler filters.
public enum FilterType {
    ///	Point filtering is used as a texture magnification or minification filter. The texel with coordinates nearest to the desired pixel value is used. The texture filter to be used between mipmap levels is nearest-point mipmap filtering. The rasterizer uses the color from the texel of the nearest mipmap texture.
    case point
    ///	Bilinear interpolation filtering is used as a texture magnification or minification filter. A weighted average of a 2 x 2 area of texels surrounding the desired pixel is used. The texture filter to use between mipmap levels is trilinear mipmap interpolation. The rasterizer linearly interpolates pixel color, using the texels of the two nearest mipmap textures.
    case linear

    internal var rawValue: WinSDK.D3D12_FILTER_TYPE {
        switch self {
        case .point:
            return WinSDK.D3D12_FILTER_TYPE_POINT
        case .linear:
            return WinSDK.D3D12_FILTER_TYPE_LINEAR
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FilterType")
public typealias D3D12_FILTER_TYPE = FilterType

public extension FilterType  {
    @available(*, deprecated, renamed: "point")
    static let D3D12_FILTER_TYPE_POINT = Self.point

    @available(*, deprecated, renamed: "linear")
    static let D3D12_FILTER_TYPE_LINEAR = Self.linear
}

#endif
