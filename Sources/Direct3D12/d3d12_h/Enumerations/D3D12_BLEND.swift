/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies blend factors, which modulate values for the pixel shader and render target.
public enum BlendFactor {
    ///	The blend factor is (0, 0, 0, 0). No pre-blend operation.
    case zero
    ///	The blend factor is (1, 1, 1, 1). No pre-blend operation.
    case one
    ///	The blend factor is (Rₛ, Gₛ, Bₛ, Aₛ), that is color data (RGB) from a pixel shader. No pre-blend operation.
    case sourceColor
    ///	The blend factor is (1 - Rₛ, 1 - Gₛ, 1 - Bₛ, 1 - Aₛ), that is color data (RGB) from a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB.
    case inverseSourceColor
    ///	The blend factor is (Aₛ, Aₛ, Aₛ, Aₛ), that is alpha data (A) from a pixel shader. No pre-blend operation.
    case sourceAlpha
    ///	The blend factor is ( 1 - Aₛ, 1 - Aₛ, 1 - Aₛ, 1 - Aₛ), that is alpha data (A) from a pixel shader. The pre-blend operation inverts the data, generating 1 - A.
    case inverseSourceAlpha
    ///	The blend factor is (Ad Ad Ad Ad), that is alpha data from a render target. No pre-blend operation.
    case destinationAlpha
    ///	The blend factor is (1 - Ad 1 - Ad 1 - Ad 1 - Ad), that is alpha data from a render target. The pre-blend operation inverts the data, generating 1 - A.
    case inverseDestinationAlpha
    /// The blend factor is (Rd, Gd, Bd, Ad), that is color data from a render target. No pre-blend operation.
    case destinationColor
    ///	The blend factor is (1 - Rd, 1 - Gd, 1 - Bd, 1 - Ad), that is color data from a render target. The pre-blend operation inverts the data, generating 1 - RGB.
    case inverseDestinationColor
    ///	The blend factor is (f, f, f, 1); where f = min(Aₛ, 1 - Ad). The pre-blend operation clamps the data to 1 or less.
    case sourceAlphaSaturate
    ///	The blend factor is the blend factor set with [ID3D12GraphicsCommandList::OMSetBlendFactor](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetblendfactor). No pre-blend operation.
    case blendFactor
    ///	The blend factor is the blend factor set with [ID3D12GraphicsCommandList::OMSetBlendFactor](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetblendfactor). The pre-blend operation inverts the blend factor, generating 1 - blend_factor.
    case inverseBlendFactor
    ///	The blend factor is data sources both as color data output by a pixel shader. There is no pre-blend operation. This blend factor supports dual-source color blending.
    case source1Color
    ///	The blend factor is data sources both as color data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB. This blend factor supports dual-source color blending.
    case inverseSource1Color
    ///	The blend factor is data sources as alpha data output by a pixel shader. There is no pre-blend operation. This blend factor supports dual-source color blending.
    case source1Alpha
    ///	The blend factor is data sources as alpha data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - A. This blend factor supports dual-source color blending.
    case inverseSource1Alpha

    internal var rawValue: _d3d12.D3D12_BLEND {
        switch self {
        case .zero:
            return _d3d12.D3D12_BLEND_ZERO
        case .one:
            return _d3d12.D3D12_BLEND_ONE
        case .sourceColor:
            return _d3d12.D3D12_BLEND_SRC_COLOR
        case .inverseSourceColor:
            return _d3d12.D3D12_BLEND_INV_SRC_COLOR
        case .sourceAlpha:
            return _d3d12.D3D12_BLEND_SRC_ALPHA
        case .inverseSourceAlpha:
            return _d3d12.D3D12_BLEND_INV_SRC_ALPHA
        case .destinationAlpha:
            return _d3d12.D3D12_BLEND_DEST_ALPHA
        case .inverseDestinationAlpha:
            return _d3d12.D3D12_BLEND_INV_DEST_ALPHA
        case .destinationColor:
            return _d3d12.D3D12_BLEND_DEST_COLOR
        case .inverseDestinationColor:
            return _d3d12.D3D12_BLEND_INV_DEST_COLOR
        case .sourceAlphaSaturate:
            return _d3d12.D3D12_BLEND_SRC_ALPHA_SAT
        case .blendFactor:
            return _d3d12.D3D12_BLEND_BLEND_FACTOR
        case .inverseBlendFactor:
            return _d3d12.D3D12_BLEND_INV_BLEND_FACTOR
        case .source1Color:
            return _d3d12.D3D12_BLEND_SRC1_COLOR
        case .inverseSource1Color:
            return _d3d12.D3D12_BLEND_INV_SRC1_COLOR
        case .source1Alpha:
            return _d3d12.D3D12_BLEND_SRC1_ALPHA
        case .inverseSource1Alpha:
            return _d3d12.D3D12_BLEND_INV_SRC1_ALPHA
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BlendFactor")
public typealias D3D12_BLEND = BlendFactor

public extension BlendFactor {
    @available(*, deprecated, renamed: "zero")
    static let D3D12_BLEND_ZERO = Self.zero

    @available(*, deprecated, renamed: "one")
    static let D3D12_BLEND_ONE = Self.one

    @available(*, deprecated, renamed: "sourceColor")
    static let D3D12_BLEND_SRC_COLOR = Self.sourceColor

    @available(*, deprecated, renamed: "inverseSourceColor")
    static let D3D12_BLEND_INV_SRC_COLOR = Self.inverseSourceColor

    @available(*, deprecated, renamed: "sourceAlpha")
    static let D3D12_BLEND_SRC_ALPHA = Self.sourceAlpha

    @available(*, deprecated, renamed: "inverseSourceAlpha")
    static let D3D12_BLEND_INV_SRC_ALPHA = Self.inverseSourceAlpha

    @available(*, deprecated, renamed: "destinationAlpha")
    static let D3D12_BLEND_DEST_ALPHA = Self.destinationAlpha
 
    @available(*, deprecated, renamed: "inverseDestinationAlpha")
    static let D3D12_BLEND_INV_DEST_ALPHA = Self.inverseDestinationAlpha
 
    @available(*, deprecated, renamed: "destinationColor")
    static let D3D12_BLEND_DEST_COLOR = Self.destinationColor
 
    @available(*, deprecated, renamed: "inverseDestinationColor")
    static let D3D12_BLEND_INV_DEST_COLOR = Self.inverseDestinationColor
 
    @available(*, deprecated, renamed: "sourceAlphaSaturate")
    static let D3D12_BLEND_SRC_ALPHA_SAT = Self.sourceAlphaSaturate
 
    @available(*, deprecated, renamed: "blendFactor")
    static let D3D12_BLEND_BLEND_FACTOR = Self.blendFactor
 
    @available(*, deprecated, renamed: "inverseBlendFactor")
    static let D3D12_BLEND_INV_BLEND_FACTOR = Self.inverseBlendFactor
 
    @available(*, deprecated, renamed: "source1Color")
    static let D3D12_BLEND_SRC1_COLOR = Self.source1Color
 
    @available(*, deprecated, renamed: "inverseSource1Color")
    static let D3D12_BLEND_INV_SRC1_COLOR = Self.inverseSource1Color

    @available(*, deprecated, renamed: "source1Alpha")
    static let D3D12_BLEND_SRC1_ALPHA = Self.source1Alpha

    @available(*, deprecated, renamed: "inverseSource1Alpha")
    static let D3D12_BLEND_INV_SRC1_ALPHA = Self.inverseSource1Alpha
}

#endif
