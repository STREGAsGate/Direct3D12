/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify a shading rate combiner (for variable-rate shading, or VRS). For more info, see Variable-rate shading (VRS).
public enum ShadingRateCombiner {

///	Specifies the combiner `C.xy = A.xy`, for combiner (C) and inputs (A and B).
case passthrough
///	Specifies the combiner `C.xy = B.xy`, for combiner (C) and inputs (A and B).
case override
///	Specifies the combiner `C.xy = max(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
case min
///	Specifies the combiner `C.xy = min(A.xy, B.xy)`, for combiner (C) and inputs (A and B).
case max
///	Specifies the combiner `C.xy = min(maxRate, A.xy + B.xy)`, for combiner (C) and inputs (A and B).
case sum

    internal var rawValue: _d3d12.D3D12_SHADING_RATE_COMBINER {
        switch self {
        case .passthrough:
            return _d3d12.D3D12_SHADING_RATE_COMBINER_PASSTHROUGH
        case .override:
            return _d3d12.D3D12_SHADING_RATE_COMBINER_OVERRIDE
        case .min:
            return _d3d12.D3D12_SHADING_RATE_COMBINER_MIN
        case .max:
            return _d3d12.D3D12_SHADING_RATE_COMBINER_MAX
        case .sum:
            return _d3d12.D3D12_SHADING_RATE_COMBINER_SUM
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShadingRateCombiner")
public typealias D3D12_SHADING_RATE_COMBINER = ShadingRateCombiner

public extension ShadingRateCombiner  {
    @available(*, deprecated, renamed: "passthrough")
    static let D3D12_SHADING_RATE_COMBINER_PASSTHROUGH = Self.passthrough
    
    @available(*, deprecated, renamed: "override")
    static let D3D12_SHADING_RATE_COMBINER_OVERRIDE = Self.override
    
    @available(*, deprecated, renamed: "min")
    static let D3D12_SHADING_RATE_COMBINER_MIN = Self.min
    
    @available(*, deprecated, renamed: "max")
    static let D3D12_SHADING_RATE_COMBINER_MAX = Self.max
    
    @available(*, deprecated, renamed: "sum")
    static let D3D12_SHADING_RATE_COMBINER_SUM = Self.sum
}

#endif
