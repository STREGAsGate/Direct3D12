/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies options for root signature layout.
public struct RootSignatureFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates default behavior.
    //public static let none = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_NONE.rawValue)

    ///	The app is opting in to using the Input Assembler (requiring an input layout that defines a set of vertex buffer bindings). Omitting this flag can result in one root argument space being saved on some hardware. Omit this flag if the Input Assembler is not required, though the optimization is minor.
    public static let allowInputAssemblerInputLayout = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT.rawValue)
    ///	Denies the vertex shader access to the root signature.
    public static let denyVertexShaderRootAccess = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_DENY_VERTEX_SHADER_ROOT_ACCESS.rawValue)
    ///	Denies the hull shader access to the root signature.
    public static let denyHullShaderRootAccess = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_DENY_HULL_SHADER_ROOT_ACCESS.rawValue)
    ///	Denies the domain shader access to the root signature.
    public static let denyDomainShaderRootAccess = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_DENY_DOMAIN_SHADER_ROOT_ACCESS.rawValue)
    ///	Denies the geometry shader access to the root signature.
    public static let denyGeometryShaderRootAccess = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_DENY_GEOMETRY_SHADER_ROOT_ACCESS.rawValue)
    ///	Denies the pixel shader access to the root signature.
    public static let denyPixelShaderRootAccess = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_DENY_PIXEL_SHADER_ROOT_ACCESS.rawValue)
    ///	The app is opting in to using Stream Output. Omitting this flag can result in one root argument space being saved on some hardware. Omit this flag if Stream Output is not required, though the optimization is minor.
    public static let allowStreamOutput = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_ALLOW_STREAM_OUTPUT.rawValue)
    ///	The root signature is to be used with raytracing shaders to define resource bindings sourced from shader records in shader tables. This flag cannot be combined with any other root signature flags, which are all related to the graphics pipeline. The absence of the flag means the root signature can be used with graphics or compute, where the compute version is also shared with raytracing’s global root signature.
    public static let localRootSignature = RootSignatureFlags(rawValue: WinSDK.D3D12_ROOT_SIGNATURE_FLAG_LOCAL_ROOT_SIGNATURE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootSignatureFlags")
public typealias D3D12_ROOT_SIGNATURE_FLAGS = RootSignatureFlags

public extension RootSignatureFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_ROOT_SIGNATURE_FLAG_NONE: RootSignatureFlags = []

    @available(*, deprecated, renamed: "allowInputAssemblerInputLayout")
    static let D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT = Self.allowInputAssemblerInputLayout

    @available(*, deprecated, renamed: "denyVertexShaderRootAccess")
    static let D3D12_ROOT_SIGNATURE_FLAG_DENY_VERTEX_SHADER_ROOT_ACCESS = Self.denyVertexShaderRootAccess

    @available(*, deprecated, renamed: "denyHullShaderRootAccess")
    static let D3D12_ROOT_SIGNATURE_FLAG_DENY_HULL_SHADER_ROOT_ACCESS = Self.denyHullShaderRootAccess

    @available(*, deprecated, renamed: "denyDomainShaderRootAccess")
    static let D3D12_ROOT_SIGNATURE_FLAG_DENY_DOMAIN_SHADER_ROOT_ACCESS = Self.denyDomainShaderRootAccess

    @available(*, deprecated, renamed: "denyGeometryShaderRootAccess")
    static let D3D12_ROOT_SIGNATURE_FLAG_DENY_GEOMETRY_SHADER_ROOT_ACCESS = Self.denyGeometryShaderRootAccess

    @available(*, deprecated, renamed: "denyPixelShaderRootAccess")
    static let D3D12_ROOT_SIGNATURE_FLAG_DENY_PIXEL_SHADER_ROOT_ACCESS = Self.denyPixelShaderRootAccess

    @available(*, deprecated, renamed: "allowStreamOutput")
    static let D3D12_ROOT_SIGNATURE_FLAG_ALLOW_STREAM_OUTPUT = Self.allowStreamOutput

    @available(*, deprecated, renamed: "localRootSignature")
    static let D3D12_ROOT_SIGNATURE_FLAG_LOCAL_ROOT_SIGNATURE = Self.localRootSignature
}

#endif
