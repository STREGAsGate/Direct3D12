/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Identifies the stencil operations that can be performed during depth-stencil testing.
public enum StencilOperations {
    ///	Keep the existing stencil data.
    case keep
    ///	Set the stencil data to 0.
    case zero
    ///	Set the stencil data to the reference value set by calling ID3D12GraphicsCommandList::OMSetStencilRef.
    case replace
    ///	Increment the stencil value by 1, and clamp the result.
    case incrementClamp
    ///	Decrement the stencil value by 1, and clamp the result.
    case decrementClamp
    ///	Invert the stencil data.
    case invert
    ///	Increment the stencil value by 1, and wrap the result if necessary.
    case incrementWrap
    ///	Decrement the stencil value by 1, and wrap the result if necessary.
    case decrementWrap

    internal var rawValue: WinSDK.D3D12_STENCIL_OP {
        switch self {
        case .keep:
            return WinSDK.D3D12_STENCIL_OP_KEEP
        case .zero:
            return WinSDK.D3D12_STENCIL_OP_ZERO
        case .replace:
            return WinSDK.D3D12_STENCIL_OP_REPLACE
        case .incrementClamp:
            return WinSDK.D3D12_STENCIL_OP_INCR_SAT
        case .decrementClamp:
            return WinSDK.D3D12_STENCIL_OP_DECR_SAT
        case .invert:
            return WinSDK.D3D12_STENCIL_OP_INVERT
        case .incrementWrap:
            return WinSDK.D3D12_STENCIL_OP_INCR
        case .decrementWrap:
            return WinSDK.D3D12_STENCIL_OP_DECR
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StencilOperations")
public typealias D3D12_STENCIL_OP = StencilOperations

public extension StencilOperations  {
    @available(*, deprecated, renamed: "keep")
    static let D3D12_STENCIL_OP_KEEP = Self.keep
    
    @available(*, deprecated, renamed: "zero")
    static let D3D12_STENCIL_OP_ZERO = Self.zero
    
    @available(*, deprecated, renamed: "replace")
    static let D3D12_STENCIL_OP_REPLACE = Self.replace
    
    @available(*, deprecated, renamed: "incrementClamp")
    static let D3D12_STENCIL_OP_INCR_SAT = Self.incrementClamp
    
    @available(*, deprecated, renamed: "decrementClamp")
    static let D3D12_STENCIL_OP_DECR_SAT = Self.decrementClamp
    
    @available(*, deprecated, renamed: "invert")
    static let D3D12_STENCIL_OP_INVERT = Self.invert
    
    @available(*, deprecated, renamed: "incrementWrap")
    static let D3D12_STENCIL_OP_INCR = Self.incrementWrap
    
    @available(*, deprecated, renamed: "decrementWrap")
    static let D3D12_STENCIL_OP_DECR = Self.decrementWrap
}

#endif
