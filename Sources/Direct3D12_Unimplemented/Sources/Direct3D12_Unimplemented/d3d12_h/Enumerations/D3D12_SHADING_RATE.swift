/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the shading rate (for variable-rate shading, or VRS). For more info, see Variable-rate shading (VRS).
public struct ShadingRate: OptionSet {
    public let rawValue: Int32

    ///	Specifies no change to the shading rate.
    public static let shadingRate1X1 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_1X1.rawValue)
    ///	Specifies that the shading rate should reduce vertical resolution 2x.
    public static let shadingRate1X2 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_1X2.rawValue)
    ///	Specifies that the shading rate should reduce horizontal resolution 2x.
    public static let shadingRate2X1 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_2X1.rawValue)
    ///	Specifies that the shading rate should reduce the resolution of both axes 2x.
    public static let shadingRate2X2 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_2X2.rawValue)
    ///	Specifies that the shading rate should reduce horizontal resolution 2x, and reduce vertical resolution 4x.
    public static let shadingRate2X4 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_2X4.rawValue)
    ///	Specifies that the shading rate should reduce horizontal resolution 4x, and reduce vertical resolution 2x.
    public static let shadingRate4X2 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_4X2.rawValue)
    ///	Specifies that the shading rate should reduce the resolution of both axes 4x.
    public static let shadingRate4X4 = ShadingRate(rawValue: WinSDK.D3D12_SHADING_RATE_4X4.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShadingRate")
public typealias D3D12_SHADING_RATE = ShadingRate

public extension ShadingRate {
    @available(*, deprecated, renamed: "shadingRate1X1")
    static let D3D12_SHADING_RATE_1X1 = Self.shadingRate1X1
    
    @available(*, deprecated, renamed: "shadingRate1X2")
    static let D3D12_SHADING_RATE_1X2 = Self.shadingRate1X2
    
    @available(*, deprecated, renamed: "shadingRate2X1")
    static let D3D12_SHADING_RATE_2X1 = Self.shadingRate2X1
    
    @available(*, deprecated, renamed: "shadingRate2X2")
    static let D3D12_SHADING_RATE_2X2 = Self.shadingRate2X2
    
    @available(*, deprecated, renamed: "shadingRate2X4")
    static let D3D12_SHADING_RATE_2X4 = Self.shadingRate2X4
    
    @available(*, deprecated, renamed: "shadingRate4X2")
    static let D3D12_SHADING_RATE_4X2 = Self.shadingRate4X2
    
    @available(*, deprecated, renamed: "shadingRate4X4")
    static let D3D12_SHADING_RATE_4X4 = Self.shadingRate4X4
}

#endif
