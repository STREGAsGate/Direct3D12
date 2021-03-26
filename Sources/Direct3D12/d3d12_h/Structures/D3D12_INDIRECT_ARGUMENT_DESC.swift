/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes an indirect argument (an indirect parameter), for use with a command signature.
public struct D3DIndirectArgumentDescription {
    public typealias RawValue = WinSDK.D3D12_INDIRECT_ARGUMENT_DESC
    internal var rawValue: RawValue

    /// A single D3D12_INDIRECT_ARGUMENT_TYPE enumeration constant.
    public var `type`: D3DIndirectArgumentType {
        get {
            return D3DIndirectArgumentType(rawValue.Type)
        }
        set {
            rawValue.Type = newValue.rawValue
        }
    }

    public struct VertexBuffer {
        /// Specifies the slot containing the vertex buffer address.
        var slot: UInt32
    }
    public var vertexBuffer: VertexBuffer {
        get {
            return unsafeBitCast(rawValue.VertexBuffer, to: VertexBuffer.self)
        }
        set {
            rawValue.VertexBuffer = unsafeBitCast(newValue, to: RawValue.__Unnamed_union___Anonymous_field1.__Unnamed_struct_VertexBuffer.self)
        }
    }

    public struct Constant {
        /// Specifies the root index of the constant.
        var rootParameterIndex: UInt32
        /// The offset, in 32-bit values, to set the first constant of the group. Supports multi-value constants at a given root index. Root constant entries must be sorted from smallest to largest DestOffsetIn32BitValues.
        var destOffsetIn32BitValues: UInt32
        /// The number of 32-bit constants that are set at the given root index. Supports multi-value constants at a given root index.
        var num32BitValuesToSet: UInt32
    }
    public var constant: Constant {
        get {
            return unsafeBitCast(rawValue.Constant, to: Constant.self)
        }
        set {
            rawValue.Constant = unsafeBitCast(newValue, to: RawValue.__Unnamed_union___Anonymous_field1.__Unnamed_struct_Constant.self)
        }
    }

    public struct ConstantBufferView {
        /// Specifies the root index of the CBV.
        var rootParameterIndex: UInt32
    }
    public var constantBufferView: ConstantBufferView {
        get {
            return unsafeBitCast(rawValue.ConstantBufferView, to: ConstantBufferView.self)
        }
        set {
            rawValue.ConstantBufferView = unsafeBitCast(newValue, to: RawValue.__Unnamed_union___Anonymous_field1.__Unnamed_struct_ConstantBufferView.self)
        }
    }

    public struct ShaderResourceView {
        /// Specifies the root index of the SRV.
        var rootParameterIndex: UInt32
    }
    public var shaderResourceView: ShaderResourceView {
        get {
            return unsafeBitCast(rawValue.ShaderResourceView, to: ShaderResourceView.self)
        }
        set {
            rawValue.ShaderResourceView = unsafeBitCast(newValue, to: RawValue.__Unnamed_union___Anonymous_field1.__Unnamed_struct_ShaderResourceView.self)
        }
    }

    public struct UnorderedAccessView {
        /// Specifies the root index of the UAV.
        var rootParameterIndex: UInt32
    }
    public var unorderedAccessView: UnorderedAccessView {
        get {
            return unsafeBitCast(rawValue.UnorderedAccessView, to: UnorderedAccessView.self)
        }
        set {
            rawValue.UnorderedAccessView = unsafeBitCast(newValue, to: RawValue.__Unnamed_union___Anonymous_field1.__Unnamed_struct_UnorderedAccessView.self)
        }
    }

    /// Describes an indirect argument (an indirect parameter), for use with a command signature.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DIndirectArgumentDescription")
public typealias D3D12_INDIRECT_ARGUMENT_DESC = D3DIndirectArgumentDescription

#endif
