/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the shading rate (for variable-rate shading, or VRS) along a horizontal or vertical axis. 
/// For more info, see [Variable-rate shading (VRS)](https://docs.microsoft.com/en-us/windows/desktop/direct3d12/vrs).
public enum AxisShadingRate {
    /// Specifies a 1x shading rate for the axis.
    case x1
    /// Specifies a 2x shading rate for the axis.
    case x2
    /// Specifies a 4x shading rate for the axis.
    case x4

    internal var rawValue: WinSDK.D3D12_AXIS_SHADING_RATE {
        switch self {
            case .x1:
                return WinSDK.D3D12_AXIS_SHADING_RATE_1X
            case .x2:
                return WinSDK.D3D12_AXIS_SHADING_RATE_2X
            case .x4:
                return WinSDK.D3D12_AXIS_SHADING_RATE_4X
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "AxisShadingRate")
public typealias D3D12_AXIS_SHADING_RATE = AxisShadingRate

@available(*, deprecated, renamed: "x1")
let D3D12_AXIS_SHADING_RATE_1X: AxisShadingRate = .x1

@available(*, deprecated, renamed: "x2")
let D3D12_AXIS_SHADING_RATE_2X: AxisShadingRate = .x2

@available(*, deprecated, renamed: "x4")
let D3D12_AXIS_SHADING_RATE_4X: AxisShadingRate = .x4

#endif
