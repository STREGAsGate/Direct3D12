/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies RGB or alpha blending operations.
public enum BlendOperation {
    ///	Add source 1 and source 2.
    case add
    ///	Subtract source 1 from source 2.
    case subtract
    ///	Subtract source 2 from source 1.
    case reverseSubtract
    ///	Find the minimum of source 1 and source 2.
    case minimum
    ///	Find the maximum of source 1 and source 2.
    case maximum

    internal var rawValue: WinSDK.D3D12_BLEND_OP {
        switch self {
        case .add:
            return WinSDK.D3D12_BLEND_OP_ADD
        case .subtract:
            return WinSDK.D3D12_BLEND_OP_SUBTRACT
        case .reverseSubtract:
            return WinSDK.D3D12_BLEND_OP_REV_SUBTRACT
        case .minimum:
            return WinSDK.D3D12_BLEND_OP_MIN
        case .maximum:
            return WinSDK.D3D12_BLEND_OP_MAX
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BlendOperation")
public typealias D3D12_BLEND_OP = BlendOperation

public extension BlendOperation {
    @available(*, deprecated, renamed: "add")
    static let D3D12_BLEND_OP_ADD = Self.add

    @available(*, deprecated, renamed: "subtract")
    static let D3D12_BLEND_OP_SUBTRACT = Self.subtract

    @available(*, deprecated, renamed: "reverseSubtract")
    static let D3D12_BLEND_OP_REV_SUBTRACT = Self.reverseSubtract

    @available(*, deprecated, renamed: "minimum")
    static let D3D12_BLEND_OP_MIN = Self.minimum

    @available(*, deprecated, renamed: "maximum")
    static let D3D12_BLEND_OP_MAX = Self.maximum
}

#endif
