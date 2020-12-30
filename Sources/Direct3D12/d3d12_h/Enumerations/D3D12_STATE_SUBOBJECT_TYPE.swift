/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// The type of a state subobject. Use with D3D12_STATE_SUBOBJECT.
public enum StateSubobjectType {

///	Subobject type is D3D12_STATE_OBJECT_CONFIG.
case stateObjectConfig

///	Subobject type is D3D12_GLOBAL_ROOT_SIGNATURE.
case globalRootSignature

///	Subobject type is D3D12_LOCAL_ROOT_SIGNATURE.
case localRootSignature
/**
Subobject type is D3D12_NODE_MASK.

> [!IMPORTANT]
> On some versions of the DirectX Runtime, specifying a node via D3D12_NODE_MASK in a D3D12_STATE_SUBOBJECT with type D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK, the runtime will incorrectly handle a node mask value of 0, which should use node #1, which will lead to errors when attempting to use the state object later. Specify an explicit node value of 1, or omit the D3D12_NODE_MASK subobject to avoid this issue.
*/
case nodeMask
///	Subobject type is D3D12_DXIL_LIBRARY_DESC.
case dxilLibrary

///	Subobject type is D3D12_EXISTING_COLLECTION_DESC.
case existingCollection

///	Subobject type is D3D12_SUBOBJECT_TO_EXPORTS_ASSOCIATION.
case subobjectToExportsAssociation

///	Subobject type is D3D12_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION.
case dxilSubobjectToExportsAssociation

///	Subobject type is D3D12_RAYTRACING_SHADER_CONFIG.
case raytracingShaderConfig

///	Subobject type is D3D12_RAYTRACING_PIPELINE_CONFIG.
case raytracingPipelineConfig

///	Subobject type is D3D12_HIT_GROUP_DESC
case hitGroup

///	The maximum valid subobject type value.
case maxValid

    internal var rawValue: _d3d12.D3D12_STATE_SUBOBJECT_TYPE {
        switch self {
        case .stateObjectConfig:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_STATE_OBJECT_CONFIG
        case .globalRootSignature:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_GLOBAL_ROOT_SIGNATURE
        case .localRootSignature:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_LOCAL_ROOT_SIGNATURE
        case .nodeMask:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK
        case .dxilLibrary:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_DXIL_LIBRARY
        case .existingCollection:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_EXISTING_COLLECTION
        case .subobjectToExportsAssociation:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_SUBOBJECT_TO_EXPORTS_ASSOCIATION
        case .dxilSubobjectToExportsAssociation:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION
        case .raytracingShaderConfig:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_SHADER_CONFIG
        case .raytracingPipelineConfig:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_PIPELINE_CONFIG
        case .hitGroup:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_HIT_GROUP
        case .maxValid:
            return _d3d12.D3D12_STATE_SUBOBJECT_TYPE_MAX_VALID
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StateSubobjectType")
public typealias D3D12_STATE_SUBOBJECT_TYPE = StateSubobjectType

public extension StateSubobjectType  {
    @available(*, deprecated, renamed: "stateObjectConfig")
    static let D3D12_STATE_SUBOBJECT_TYPE_STATE_OBJECT_CONFIG = Self.stateObjectConfig

    @available(*, deprecated, renamed: "globalRootSignature")
    static let D3D12_STATE_SUBOBJECT_TYPE_GLOBAL_ROOT_SIGNATURE = Self.globalRootSignature

    @available(*, deprecated, renamed: "localRootSignature")
    static let D3D12_STATE_SUBOBJECT_TYPE_LOCAL_ROOT_SIGNATURE = Self.localRootSignature
    
    @available(*, deprecated, renamed: "nodeMask")
    static let D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK = Self.nodeMask
    
    @available(*, deprecated, renamed: "dxilLibrary")
    static let D3D12_STATE_SUBOBJECT_TYPE_DXIL_LIBRARY = Self.dxilLibrary
    
    @available(*, deprecated, renamed: "existingCollection")
    static let D3D12_STATE_SUBOBJECT_TYPE_EXISTING_COLLECTION = Self.existingCollection
    
    @available(*, deprecated, renamed: "subobjectToExportsAssociation")
    static let D3D12_STATE_SUBOBJECT_TYPE_SUBOBJECT_TO_EXPORTS_ASSOCIATION = Self.subobjectToExportsAssociation
    
    @available(*, deprecated, renamed: "dxilSubobjectToExportsAssociation")
    static let D3D12_STATE_SUBOBJECT_TYPE_DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION = Self.dxilSubobjectToExportsAssociation
    
    @available(*, deprecated, renamed: "raytracingShaderConfig")
    static let D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_SHADER_CONFIG = Self.raytracingShaderConfig
    
    @available(*, deprecated, renamed: "raytracingPipelineConfig")
    static let D3D12_STATE_SUBOBJECT_TYPE_RAYTRACING_PIPELINE_CONFIG = Self.raytracingPipelineConfig
    
    @available(*, deprecated, renamed: "hitGroup")
    static let D3D12_STATE_SUBOBJECT_TYPE_HIT_GROUP = Self.hitGroup
    
    @available(*, deprecated, renamed: "maxValid")
    static let D3D12_STATE_SUBOBJECT_TYPE_MAX_VALID = Self.maxValid
}

#endif
