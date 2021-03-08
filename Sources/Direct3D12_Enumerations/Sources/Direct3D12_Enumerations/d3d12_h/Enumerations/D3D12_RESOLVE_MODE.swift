/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies a resolve operation.
public enum ResolveMode {
    ///	Resolves compressed source samples to their uncompressed values. When using this operation, the source and destination resources must have the same sample count, unlike the min, max, and average operations that require the destination to have a sample count of 1.
    case decompress
    ///	Resolves the source samples to their minimum value. It can be used with any render target or depth stencil format.
    case min
    ///	Resolves the source samples to their maximum value. It can be used with any render target or depth stencil format.
    case max
    ///	Resolves the source samples to their average value. It can be used with any non-integer render target format, including the depth plane. It can't be used with integer render target formats, including the stencil plane.
    case average
    case encodeSamplerFeedback
    case decodeSamplerFeedback

    internal var rawValue: WinSDK.D3D12_RESOLVE_MODE {
        switch self {
        case .decompress:
            return WinSDK.D3D12_RESOLVE_MODE_DECOMPRESS
        case .min:
            return WinSDK.D3D12_RESOLVE_MODE_MIN
        case .max:
            return WinSDK.D3D12_RESOLVE_MODE_MAX
        case .average:
            return WinSDK.D3D12_RESOLVE_MODE_AVERAGE
        case .encodeSamplerFeedback:
            return WinSDK.D3D12_RESOLVE_MODE_ENCODE_SAMPLER_FEEDBACK
        case .decodeSamplerFeedback:
            return WinSDK.D3D12_RESOLVE_MODE_DECODE_SAMPLER_FEEDBACK
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResolveMode")
public typealias D3D12_RESOLVE_MODE = ResolveMode

public extension ResolveMode  {
    @available(*, deprecated, renamed: "decompress")
    static let D3D12_RESOLVE_MODE_DECOMPRESS = Self.decompress

    @available(*, deprecated, renamed: "min")
    static let D3D12_RESOLVE_MODE_MIN = Self.min

    @available(*, deprecated, renamed: "max")
    static let D3D12_RESOLVE_MODE_MAX = Self.max

    @available(*, deprecated, renamed: "average")
    static let D3D12_RESOLVE_MODE_AVERAGE = Self.average

    @available(*, deprecated, renamed: "encodeSamplerFeedback")
    static let D3D12_RESOLVE_MODE_ENCODE_SAMPLER_FEEDBACK = Self.encodeSamplerFeedback

    @available(*, deprecated, renamed: "decodeSamplerFeedback")
    static let D3D12_RESOLVE_MODE_DECODE_SAMPLER_FEEDBACK = Self.decodeSamplerFeedback
}

#endif
