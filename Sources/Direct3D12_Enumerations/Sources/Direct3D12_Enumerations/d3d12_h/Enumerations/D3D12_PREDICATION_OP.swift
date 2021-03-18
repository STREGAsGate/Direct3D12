/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the predication operation to apply.
public enum PredictionOperation {
    ///	Enables predication if all 64-bits are zero.
    case equalZero
    ///	Enables predication if at least one of the 64-bits are not zero.
    case notEqualZero

    internal var rawValue: WinSDK.D3D12_PREDICATION_OP {
        switch self {
        case .equalZero:
            return WinSDK.D3D12_PREDICATION_OP_EQUAL_ZERO
        case .notEqualZero:
            return WinSDK.D3D12_PREDICATION_OP_NOT_EQUAL_ZERO
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
