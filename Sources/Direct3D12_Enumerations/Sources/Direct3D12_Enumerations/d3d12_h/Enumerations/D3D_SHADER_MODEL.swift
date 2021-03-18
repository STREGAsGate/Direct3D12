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
    @available(Windows, introduced: 10.0.16299)
    case v6_1
    /// Indicates shader model 6.2.
    @available(Windows, introduced: 10.0.18362) // possibly available earlier
    case v6_2
    /// Indicates shader model 6.3.
    @available(Windows, introduced: 10.0.18362) // possibly available earlier
    case v6_3
    /// Indicates shader model 6.4.
    @available(Windows, introduced: 10.0.18362)
    case v6_4
    /// Indicates shader model 6.5.
    @available(Windows, introduced: 10.0.18362)
    case v6_5
    /// Indicates shader model 6.6.
    @available(Windows, introduced: 10.0.2004) // possibly available earlier
    case v6_6

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
            case .v6_5:
                return WinSDK.D3D_SHADER_MODEL_6_5
            case .v6_6:
                return WinSDK.D3D_SHADER_MODEL_6_6
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderModel")
public typealias D3D_SHADER_MODEL = ShaderModel


@available(*, deprecated, renamed: "v5_1")
let D3D_SHADER_MODEL_5_1: ShaderModel = .v5_1

@available(*, deprecated, renamed: "v6_0")
let D3D_SHADER_MODEL_6_0: ShaderModel = .v6_0

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "v6_1")
let D3D_SHADER_MODEL_6_1: ShaderModel = .v6_1

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "v6_2")
let D3D_SHADER_MODEL_6_2: ShaderModel = .v6_2

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "v6_3")
let D3D_SHADER_MODEL_6_3: ShaderModel = .v6_3

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "v6_4")
let D3D_SHADER_MODEL_6_4: ShaderModel = .v6_4

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "v6_5")
let D3D_SHADER_MODEL_6_5: ShaderModel = .v6_5

@available(Windows, introduced: 10.0.2004)
@available(*, deprecated, renamed: "v6_6")
let D3D_SHADER_MODEL_6_6: ShaderModel = .v6_6

#endif
