/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the border color for a static sampler.
public enum StaticBorderColor {
    ///	Indicates black, with the alpha component as fully transparent.
    case transparentBlack
    ///	Indicates black, with the alpha component as fully opaque.
    case opaqueBlack
    ///	Indicates white, with the alpha component as fully opaque.
    case opaqueWhite

    internal var rawValue: WinSDK.D3D12_STATIC_BORDER_COLOR {
        switch self {
        case .transparentBlack:
            return WinSDK.D3D12_STATIC_BORDER_COLOR_TRANSPARENT_BLACK
        case .opaqueBlack:
            return WinSDK.D3D12_STATIC_BORDER_COLOR_OPAQUE_BLACK
        case .opaqueWhite:
            return WinSDK.D3D12_STATIC_BORDER_COLOR_OPAQUE_WHITE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StaticBorderColor")
public typealias D3D12_STATIC_BORDER_COLOR = StaticBorderColor

public extension StaticBorderColor  {
    @available(*, deprecated, renamed: "transparentBlack")
    static let D3D12_STATIC_BORDER_COLOR_TRANSPARENT_BLACK = Self.transparentBlack

    @available(*, deprecated, renamed: "opaqueBlack")
    static let D3D12_STATIC_BORDER_COLOR_OPAQUE_BLACK = Self.opaqueBlack
    
    @available(*, deprecated, renamed: "opaqueWhite")
    static let D3D12_STATIC_BORDER_COLOR_OPAQUE_WHITE = Self.opaqueWhite
}

#endif
