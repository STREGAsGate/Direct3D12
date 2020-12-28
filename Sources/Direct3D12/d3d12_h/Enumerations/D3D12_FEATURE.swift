/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify a Direct3D 12 feature or feature set to query about. When you want to query for the level to which an adapter supports a feature, pass one of these values to ID3D12Device::CheckFeatureSupport.
public enum Feature {
    ///	Indicates a query for the level of support for basic Direct3D 12 feature options. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS.
    case options
    ///Indicates a query for the adapter's architectural details, so that your application can better optimize for certain adapter properties. The corresponding data structure for this value is D3D12_FEATURE_DATA_ARCHITECTURE.
    ///- Note: This value has been superseded by the D3D_FEATURE_DATA_ARCHITECTURE1 value. If your application targets Windows 10, version 1703 (Creators' Update) or higher, then use the D3D_FEATURE_DATA_ARCHITECTURE1 value instead.
    case architecture
    ///	Indicates a query for info about the feature levels supported. The corresponding data structure for this value is D3D12_FEATURE_DATA_FEATURE_LEVELS.
    case featureLevels
    ///	Indicates a query for the resources supported by the current graphics driver for a given format. The corresponding data structure for this value is D3D12_FEATURE_DATA_FORMAT_SUPPORT.
    case formatSupport
    ///	Indicates a query for the image quality levels for a given format and sample count. The corresponding data structure for this value is D3D12_FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS.
    case multisampleQualityLevels
    ///	Indicates a query for the DXGI data format. The corresponding data structure for this value is D3D12_FEATURE_DATA_FORMAT_INFO.
    case formatInfo
    ///	Indicates a query for the GPU's virtual address space limitations. The corresponding data structure for this value is D3D12_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT.
    case gpuVirtualAddressSupport
    ///	Indicates a query for the supported shader model. The corresponding data structure for this value is D3D12_FEATURE_DATA_SHADER_MODEL.
    case shaderModel
    ///	Indicates a query for the level of support for HLSL 6.0 wave operations. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS1.
    case options1
    ///	Indicates a query for the level of support for protected resource sessions. The corresponding data structure for this value is D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT.
    case protectedResourceSessionSupport
    ///	Indicates a query for root signature version support. The corresponding data structure for this value is D3D12_FEATURE_DATA_ROOT_SIGNATURE.
    case rootSignature
    ///Indicates a query for each adapter's architectural details, so that your application can better optimize for certain adapter properties. The corresponding data structure for this value is D3D12_FEATURE_DATA_ARCHITECTURE1.
    ///- Note: This value supersedes the D3D_FEATURE_DATA_ARCHITECTURE value. If your application targets Windows 10, version 1703 (Creators' Update) or higher, then use D3D_FEATURE_DATA_ARCHITECTURE1.
    case architecture1
    ///	Indicates a query for the level of support for depth-bounds tests and programmable sample positions. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS2.
    case options2
    ///	Indicates a query for the level of support for shader caching. The corresponding data structure for this value is D3D12_FEATURE_DATA_SHADER_CACHE.
    case shaderCache
    ///	Indicates a query for the adapter's support for prioritization of different command queue types. The corresponding data structure for this value is D3D12_FEATURE_DATA_COMMAND_QUEUE_PRIORITY.
    case commandQueuePriority
    ///	Indicates a query for the level of support for timestamp queries, format-casting, immediate write, view instancing, and barycentrics. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS3.
    case options3
    ///	Indicates a query for whether or not the adapter supports creating heaps from existing system memory. The corresponding data structure for this value is D3D12_FEATURE_DATA_EXISTING_HEAPS.
    case existingHeaps
    ///	Indicates a query for the level of support for 64KB-aligned MSAA textures, cross-API sharing, and native 16-bit shader operations. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS4.
    case options4
    ///	Indicates a query for the level of support for heap serialization. The corresponding data structure for this value is D3D12_FEATURE_DATA_SERIALIZATION.
    case serialization
    ///	Indicates a query for the level of support for the sharing of resources between different adapters—for example, multiple GPUs. The corresponding data structure for this value is D3D12_FEATURE_DATA_CROSS_NODE.
    case crossNode
    ///	Starting with Windows 10, version 1809 (10.0; Build 17763), indicates a query for the level of support for render passes, ray tracing, and shader-resource view tier 3 tiled resources. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS5.
    case options5
    ///	Starting with Windows 10, version 1903 (10.0; Build 18362), indicates a query for the level of support for variable-rate shading (VRS), and indicates whether or not background processing is supported. For more info, see Variable-rate shading (VRS), and the Direct3D 12 background processing spec.
    case options6
    ///	Indicates a query for the level of support for metacommands. The corresponding data structure for this value is D3D12_FEATURE_DATA_QUERY_META_COMMAND.
    case queryMetaCommand
    case options7
    case protectedResourceSessionTypeCount
    case protectedResourceSessionTypes

    internal var rawValue: _d3d12.D3D12_FEATURE {
        switch self {
        case .options:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS
        case .architecture:
            return _d3d12.D3D12_FEATURE_ARCHITECTURE
        case .featureLevels:
            return _d3d12.D3D12_FEATURE_FEATURE_LEVELS
        case .formatSupport:
            return _d3d12.D3D12_FEATURE_FORMAT_SUPPORT
        case .multisampleQualityLevels:
            return _d3d12.D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS
        case .formatInfo:
            return _d3d12.D3D12_FEATURE_FORMAT_INFO
        case .gpuVirtualAddressSupport:
            return _d3d12.D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT
        case .shaderModel:
            return _d3d12.D3D12_FEATURE_SHADER_MODEL
        case .options1:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS1
        case .protectedResourceSessionSupport:
            return _d3d12.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT
        case .rootSignature:
            return _d3d12.D3D12_FEATURE_ROOT_SIGNATURE
        case .architecture1:
            return _d3d12.D3D12_FEATURE_ARCHITECTURE1
        case .options2:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS2
        case .shaderCache:
            return _d3d12.D3D12_FEATURE_SHADER_CACHE
        case .commandQueuePriority:
            return _d3d12.D3D12_FEATURE_COMMAND_QUEUE_PRIORITY
        case .options3:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS3
        case .existingHeaps:
            return _d3d12.D3D12_FEATURE_EXISTING_HEAPS
        case .options4:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS4
        case .serialization:
            return _d3d12.D3D12_FEATURE_SERIALIZATION
        case .crossNode:
            return _d3d12.D3D12_FEATURE_CROSS_NODE
        case .options5:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS5
        case .options6:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS6
        case .queryMetaCommand:
            return _d3d12.D3D12_FEATURE_QUERY_META_COMMAND
        case .options7:
            return _d3d12.D3D12_FEATURE_D3D12_OPTIONS7
        case .protectedResourceSessionTypeCount:
            return _d3d12.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT
        case .protectedResourceSessionTypes:
            return _d3d12.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Feature")
public typealias D3D12_FEATURE = Feature

public extension Feature  {
    @available(*, deprecated, renamed: "options")
    static let D3D12_FEATURE_D3D12_OPTIONS = Self.options

    @available(*, deprecated, renamed: "architecture")
    static let D3D12_FEATURE_ARCHITECTURE = Self.architecture

    @available(*, deprecated, renamed: "featureLevels")
    static let D3D12_FEATURE_FEATURE_LEVELS = Self.featureLevels
    
    @available(*, deprecated, renamed: "formatSupport")
    static let D3D12_FEATURE_FORMAT_SUPPORT = Self.formatSupport

    @available(*, deprecated, renamed: "multisampleQualityLevels")
    static let D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS = Self.multisampleQualityLevels
    
    @available(*, deprecated, renamed: "formatInfo")
    static let D3D12_FEATURE_FORMAT_INFO = Self.formatInfo
    
    @available(*, deprecated, renamed: "gpuVirtualAddressSupport")
    static let D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT = Self.gpuVirtualAddressSupport
    
    @available(*, deprecated, renamed: "shaderModel")
    static let D3D12_FEATURE_SHADER_MODEL = Self.shaderModel
    
    @available(*, deprecated, renamed: "options1")
    static let D3D12_FEATURE_D3D12_OPTIONS1 = Self.options1
    
    @available(*, deprecated, renamed: "protectedResourceSessionSupport")
    static let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT = Self.protectedResourceSessionSupport
    
    @available(*, deprecated, renamed: "rootSignature")
    static let D3D12_FEATURE_ROOT_SIGNATURE = Self.rootSignature
    
    @available(*, deprecated, renamed: "architecture1")
    static let D3D12_FEATURE_ARCHITECTURE1 = Self.architecture1
    
    @available(*, deprecated, renamed: "options2")
    static let D3D12_FEATURE_D3D12_OPTIONS2 = Self.options2
    
    @available(*, deprecated, renamed: "shaderCache")
    static let D3D12_FEATURE_SHADER_CACHE = Self.shaderCache
    
    @available(*, deprecated, renamed: "commandQueuePriority")
    static let D3D12_FEATURE_COMMAND_QUEUE_PRIORITY = Self.commandQueuePriority
    
    @available(*, deprecated, renamed: "options3")
    static let D3D12_FEATURE_D3D12_OPTIONS3 = Self.options3
    
    @available(*, deprecated, renamed: "existingHeaps")
    static let D3D12_FEATURE_EXISTING_HEAPS = Self.existingHeaps
    
    @available(*, deprecated, renamed: "options4")
    static let D3D12_FEATURE_D3D12_OPTIONS4 = Self.options4
    
    @available(*, deprecated, renamed: "serialization")
    static let D3D12_FEATURE_SERIALIZATION = Self.serialization
    
    @available(*, deprecated, renamed: "crossNode")
    static let D3D12_FEATURE_CROSS_NODE = Self.crossNode
    
    @available(*, deprecated, renamed: "options5")
    static let D3D12_FEATURE_D3D12_OPTIONS5 = Self.options5
    
    @available(*, deprecated, renamed: "options6")
    static let D3D12_FEATURE_D3D12_OPTIONS6 = Self.options6
    
    @available(*, deprecated, renamed: "queryMetaCommand")
    static let D3D12_FEATURE_QUERY_META_COMMAND = Self.queryMetaCommand
      
    @available(*, deprecated, renamed: "options7")
    static let D3D12_FEATURE_D3D12_OPTIONS7 = Self.options7
      
    @available(*, deprecated, renamed: "protectedResourceSessionTypeCount")
    static let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT = Self.protectedResourceSessionTypeCount
      
    @available(*, deprecated, renamed: "protectedResourceSessionTypes")
    static let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES = Self.protectedResourceSessionTypes
}

#endif
