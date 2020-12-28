/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify the shading rate (for variable-rate shading, or VRS) along a horizontal or vertical axis. 
/// For more info, see [Variable-rate shading (VRS)](https://docs.microsoft.com/en-us/windows/desktop/direct3d12/vrs).
public enum AxisShadingRate {
    /// Specifies a 1x shading rate for the axis.
    case x1
    /// Specifies a 2x shading rate for the axis.
    case x2
    /// Specifies a 4x shading rate for the axis.
    case x4

    internal var rawValue: _d3d12.D3D12_AXIS_SHADING_RATE {
        switch self {
            case .x1:
                return _d3d12.D3D12_AXIS_SHADING_RATE_1X
            case .x2:
                return _d3d12.D3D12_AXIS_SHADING_RATE_2X
            case .x4:
                return _d3d12.D3D12_AXIS_SHADING_RATE_4X
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "AxisShadingRate")
public typealias D3D12_AXIS_SHADING_RATE = AxisShadingRate

public extension AxisShadingRate {
    @available(*, deprecated, renamed: "x1")
    static let D3D12_AXIS_SHADING_RATE_1X = Self.x1

    @available(*, deprecated, renamed: "x2")
    static let D3D12_AXIS_SHADING_RATE_2X = Self.x2

    @available(*, deprecated, renamed: "x4")
    static let D3D12_AXIS_SHADING_RATE_4X = Self.x4
}
