/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies how memory gets routed by a shader resource view (SRV).
public enum ShaderComponentMapping {
///	Indicates return component 0 (red).
case red
///	Indicates return component 1 (green).
case green
///	Indicates return component 2 (blue).
case blue
///	Indicates return component 3 (alpha).
case alpha
///	Indicates forcing the resulting value to 0.
case forceZero
///	Indicates forcing the resulting value 1. The value of forcing 1 is either 0x1 or 1.0f depending on the format type for that component in the source format.
case forceOne

    internal var rawValue: WinSDK.D3D12_SHADER_COMPONENT_MAPPING {
        switch self {
        case .red:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_0
        case .green:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_1
        case .blue:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_2
        case .alpha:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_3
        case .forceZero:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_0
        case .forceOne:
            return WinSDK.D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_1
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ShaderComponentMapping")
public typealias D3D12_SHADER_COMPONENT_MAPPING = ShaderComponentMapping

public extension ShaderComponentMapping  {
    @available(*, deprecated, renamed: "red")
    static let D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_0 = Self.red
    
    @available(*, deprecated, renamed: "green")
    static let D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_1 = Self.green
        
    @available(*, deprecated, renamed: "blue")
    static let D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_2 = Self.blue
        
    @available(*, deprecated, renamed: "alpha")
    static let D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_3 = Self.alpha
        
    @available(*, deprecated, renamed: "forceZero")
    static let D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_0 = Self.forceZero
        
    @available(*, deprecated, renamed: "forceOne")
    static let D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_1 = Self.forceOne
}

#endif
