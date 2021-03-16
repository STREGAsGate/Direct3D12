/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a shader model.
public enum ShaderModel {
    /// Indicates shader model 5.1.
    case v5_1
    /// Indicates shader model 6.0.
    case v6_0
    /// Indicates shader model 6.1.
    case v6_1	
    /// Indicates shader model 6.2.
    case v6_2	
    /// Indicates shader model 6.3.
    case v6_3
    /// Indicates shader model 6.4.
    case v6_4	

    internal var rawValue: WinSDK.D3D_SHADER_MODEL {
        switch self {
            case .v5_1:
                return WinSDK.D3D_SHADER_MODEL_5_1
            case .v6_0:
                return WinSDK.D3D_SHADER_MODEL_6_0
            case .v6_1:
                return WinSDK.D3D_SHADER_MODEL_6_1
            case .v6_2:
                return WinSDK.D3D_SHADER_MODEL_6_2
            case .v6_3:
                return WinSDK.D3D_SHADER_MODEL_6_3
            case .v6_4:
                return WinSDK.D3D_SHADER_MODEL_6_4
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderModel")
public typealias D3D_SHADER_MODEL = ShaderModel

public extension ShaderModel {
    @available(*, deprecated, renamed: "v5_1")
    static let D3D_SHADER_MODEL_5_1 = Self.v5_1

    @available(*, deprecated, renamed: "v6_0")
    static let D3D_SHADER_MODEL_6_0 = Self.v6_0

    @available(*, deprecated, renamed: "v6_1")
    static let D3D_SHADER_MODEL_6_1 = Self.v6_1

    @available(*, deprecated, renamed: "v6_2")
    static let D3D_SHADER_MODEL_6_2 = Self.v6_2

    @available(*, deprecated, renamed: "v6_3")
    static let D3D_SHADER_MODEL_6_3 = Self.v6_3
    
    @available(*, deprecated, renamed: "v6_4")
    static let D3D_SHADER_MODEL_6_4 = Self.v6_4
}

#endif
