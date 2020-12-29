/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

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

    internal var rawValue: _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE {
        switch self {
        case .draw:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_DRAW
        case .drawIndexed:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED
        case .dispatch:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH
        case .vertexBufferView:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW
        case .indexBufferView:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW
        case .constant:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT
        case .constantBufferView:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW
        case .shaderResourceView:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW
        case .unorderedAccessView:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW
        case .dispatchRays:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS
        case .dispatchMesh:
            return _d3d12.D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH
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
