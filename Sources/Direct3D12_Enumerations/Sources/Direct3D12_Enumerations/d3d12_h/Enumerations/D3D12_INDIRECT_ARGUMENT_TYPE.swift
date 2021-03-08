/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies the type of the indirect parameter.
public enum IndirectArgumentType {
    ///	Indicates the type is a Draw call.
    case draw
    ///	Indicates the type is a DrawIndexed call.
    case drawIndexed
    ///	Indicates the type is a Dispatch call.
    case dispatch
    ///	Indicates the type is a vertex buffer view.
    case vertexBufferView
    ///	Indicates the type is an index buffer view.
    case indexBufferView
    ///	Indicates the type is a constant.
    case constant
    ///	Indicates the type is a constant buffer view (CBV).
    case constantBufferView
    ///	Indicates the type is a shader resource view (SRV).
    case shaderResourceView
    ///	Indicates the type is an unordered access view (UAV).
    case unorderedAccessView
    case dispatchRays
    case dispatchMesh

    internal var rawValue: WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE {
        switch self {
        case .draw:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_DRAW
        case .drawIndexed:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED
        case .dispatch:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH
        case .vertexBufferView:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW
        case .indexBufferView:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW
        case .constant:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT
        case .constantBufferView:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW
        case .shaderResourceView:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW
        case .unorderedAccessView:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW
        case .dispatchRays:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS
        case .dispatchMesh:
            return WinSDK.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "IndirectArgumentType")
public typealias D3D12_INDIRECT_ARGUMENT_TYPE = IndirectArgumentType

public extension IndirectArgumentType  {
    @available(*, deprecated, renamed: "draw")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_DRAW = Self.draw
    
    @available(*, deprecated, renamed: "drawIndexed")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED = Self.drawIndexed
    
    @available(*, deprecated, renamed: "dispatch")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH = Self.dispatch
    
    @available(*, deprecated, renamed: "vertexBufferView")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW = Self.vertexBufferView
    
    @available(*, deprecated, renamed: "indexBufferView")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW = Self.indexBufferView
    
    @available(*, deprecated, renamed: "constant")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT = Self.constant
    
    @available(*, deprecated, renamed: "constantBufferView")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW = Self.constantBufferView
    
    @available(*, deprecated, renamed: "shaderResourceView")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW = Self.shaderResourceView
    
    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW = Self.unorderedAccessView
    
    @available(*, deprecated, renamed: "dispatchRays")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS = Self.dispatchRays
    
    @available(*, deprecated, renamed: "dispatchMesh")
    static let D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH = Self.dispatchMesh
}

#endif
