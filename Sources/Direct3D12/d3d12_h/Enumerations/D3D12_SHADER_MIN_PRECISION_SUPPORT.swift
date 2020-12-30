/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Describes minimum precision support options for shaders in the current graphics driver.
public struct ShaderMinimumPrecisionSupport: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// The driver supports only full 32-bit precision for all shader stages.
    //static let none = ShaderMinimumPrecisionSupport(rawValue: _d3d12.D3D12_SHADER_MIN_PRECISION_SUPPORT_NONE.rawValue)

    ///	The driver supports 10-bit precision.
    static let supports10bit = ShaderMinimumPrecisionSupport(rawValue: _d3d12.D3D12_SHADER_MIN_PRECISION_SUPPORT_10_BIT.rawValue)
    ///	The driver supports 16-bit precision.
    static let supports16bit = ShaderMinimumPrecisionSupport(rawValue: _d3d12.D3D12_SHADER_MIN_PRECISION_SUPPORT_16_BIT.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderMinimumPrecisionSupport")
public typealias D3D12_SHADER_MIN_PRECISION_SUPPORT = ShaderMinimumPrecisionSupport

public extension ShaderMinimumPrecisionSupport {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_SHADER_MIN_PRECISION_SUPPORT_NONE: ShaderMinimumPrecisionSupport = []

    @available(*, deprecated, renamed: "supports10bit")
    static let D3D12_SHADER_MIN_PRECISION_SUPPORT_10_BIT = Self.supports10bit

    @available(*, deprecated, renamed: "supports16bit")
    static let D3D12_SHADER_MIN_PRECISION_SUPPORT_16_BIT = Self.supports16bit
}

#endif
