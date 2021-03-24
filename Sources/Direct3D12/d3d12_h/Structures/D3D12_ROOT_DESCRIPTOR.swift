/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes descriptors inline in the root signature version 1.0 that appear in shaders.
public struct D3DRootDescriptor {
    public typealias RawValue = WinSDK.D3D12_ROOT_DESCRIPTOR
    internal var rawValue: RawValue

    /// The shader register.
    public var shaderRegister: UInt32 {
        get {
            return rawValue.ShaderRegister
        }
        set {
            rawValue.ShaderRegister = newValue
        }
    }

    /// The register space.
    public var registerSpace: UInt32 {
        get {
            return rawValue.RegisterSpace
        }
        set {
            rawValue.RegisterSpace = newValue
        }
    }

    /** Describes descriptors inline in the root signature version 1.0 that appear in shaders.
    - parameter shaderRegister: The shader register.
    - parameter registerSpace: The register space.
    */
    public init(shaderRegister: UInt32, registerSpace: UInt32) {
        self.rawValue = RawValue(ShaderRegister: shaderRegister, RegisterSpace: registerSpace)
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRootDescriptor")
public typealias D3D12_ROOT_DESCRIPTOR = D3DRootDescriptor

#endif
