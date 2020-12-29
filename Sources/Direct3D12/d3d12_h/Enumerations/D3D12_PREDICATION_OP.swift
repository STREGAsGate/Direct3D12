/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the predication operation to apply.
public enum PredictionOperation {
    ///	Enables predication if all 64-bits are zero.
    case equalZero
    ///	Enables predication if at least one of the 64-bits are not zero.
    case notEqualZero

    internal var rawValue: _d3d12.D3D12_PREDICATION_OP {
        switch self {
        case .equalZero:
            return _d3d12.D3D12_PREDICATION_OP_EQUAL_ZERO
        case .notEqualZero:
            return _d3d12.D3D12_PREDICATION_OP_NOT_EQUAL_ZERO
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PredictionOperation")
public typealias D3D12_PREDICATION_OP = PredictionOperation

public extension PredictionOperation  {
    @available(*, deprecated, renamed: "equalZero")
    static let D3D12_PREDICATION_OP_EQUAL_ZERO = Self.equalZero

    @available(*, deprecated, renamed: "notEqualZero")
    static let D3D12_PREDICATION_OP_NOT_EQUAL_ZERO = Self.notEqualZero
}

#endif
