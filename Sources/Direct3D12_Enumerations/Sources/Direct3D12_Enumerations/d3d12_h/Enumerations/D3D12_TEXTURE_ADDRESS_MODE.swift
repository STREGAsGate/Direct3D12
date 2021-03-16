/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies a technique for resolving texture coordinates that are outside of the boundaries of a texture.
public enum TextureAddressMode {
    ///	Tile the texture at every (u,v) integer junction.
    /// For example, for u values between 0 and 3, the texture is repeated three times.
    case wrap
    ///	Flip the texture at every (u,v) integer junction.
    /// For u values between 0 and 1, for example, the texture is addressed normally; between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again; and so on.
    case mirror
    ///	Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
    case clamp
    ///	Texture coordinates outside the range [0.0, 1.0] are set to the border color specified in D3D12_SAMPLER_DESC or HLSL code.
    case border
    ///	Similar to D3D12_TEXTURE_ADDRESS_MODE_MIRROR and D3D12_TEXTURE_ADDRESS_MODE_CLAMP.
    /// Takes the absolute value of the texture coordinate (thus, mirroring around 0), and then clamps to the maximum value.
    case mirrorOnce

    internal var rawValue: WinSDK.D3D12_TEXTURE_ADDRESS_MODE {
        switch self {
        case .wrap:
            return WinSDK.D3D12_TEXTURE_ADDRESS_MODE_WRAP
        case .mirror:
            return WinSDK.D3D12_TEXTURE_ADDRESS_MODE_MIRROR
        case .clamp:
            return WinSDK.D3D12_TEXTURE_ADDRESS_MODE_CLAMP
        case .border:
            return WinSDK.D3D12_TEXTURE_ADDRESS_MODE_BORDER
        case .mirrorOnce:
            return WinSDK.D3D12_TEXTURE_ADDRESS_MODE_MIRROR_ONCE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TextureAddressMode")
public typealias D3D12_TEXTURE_ADDRESS_MODE = TextureAddressMode

public extension TextureAddressMode  {
    @available(*, deprecated, renamed: "wrap")
    static let D3D12_TEXTURE_ADDRESS_MODE_WRAP = Self.wrap
    
    @available(*, deprecated, renamed: "mirror")
    static let D3D12_TEXTURE_ADDRESS_MODE_MIRROR = Self.mirror
    
    @available(*, deprecated, renamed: "clamp")
    static let D3D12_TEXTURE_ADDRESS_MODE_CLAMP = Self.clamp
    
    @available(*, deprecated, renamed: "border")
    static let D3D12_TEXTURE_ADDRESS_MODE_BORDER = Self.border
    
    @available(*, deprecated, renamed: "mirrorOnce")
    static let D3D12_TEXTURE_ADDRESS_MODE_MIRROR_ONCE = Self.mirrorOnce
}

#endif
