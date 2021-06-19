/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the subresources from an array of multi sampled 2D textures for a depth-stencil view.
public struct D3DTexture2DMultiSampledArrayDepthStencilView {
    public typealias RawValue = WinSDK.D3D12_TEX2DMS_ARRAY_DSV
    internal var rawValue: RawValue

    /// The index of the first texture to use in an array of textures.
    public var textureIndex: UInt32 {
        get {
            return rawValue.FirstArraySlice
        }
        set {
            rawValue.FirstArraySlice = newValue
        }
    }

    /// Number of textures to use.
    public var textureCount: UInt32 {
        get {
            return rawValue.ArraySize
        }
        set {
            rawValue.ArraySize = newValue
        }
    }

    /** Describes the subresources from an array of multi sampled 2D textures for a depth-stencil view.
    - parameter firstArraySlice: The index of the first texture to use in an array of textures.
    - parameter arraySize: Number of textures to use.
    */
    public init(textureIndex: UInt32, textureCount: UInt32) {
        self.rawValue = RawValue(FirstArraySlice: textureIndex, ArraySize: textureCount)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DTexture2DMultiSampledArrayDepthStencilView")
public typealias D3D12_TEX2DMS_ARRAY_DSV = D3DTexture2DMultiSampledArrayDepthStencilView

#endif