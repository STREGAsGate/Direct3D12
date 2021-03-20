/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify a Direct3D 12 feature or feature set to query about. When you want to query for the level to which an adapter supports a feature, pass one of these values to ID3D12Device::CheckFeatureSupport.
public enum Feature {
    public typealias RawValue = WinSDK.D3D12_FEATURE
    ///	Indicates a query for the level of support for basic Direct3D 12 feature options. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS.
    case options
    ///Indicates a query for the adapter's architectural details, so that your application can better optimize for certain adapter properties. The corresponding data structure for this value is D3D12_FEATURE_DATA_ARCHITECTURE.
    ///- Note: This value has been superseded by the D3D_FEATURE_DATA_ARCHITECTURE1 value. If your application targets Windows 10, version 1703 (Creators' Update) or higher, then use the D3D_FEATURE_DATA_ARCHITECTURE1 value instead.
    @available(Windows, deprecated: 10.0.15063, renamed: "architecture1")
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
    @available(Windows, introduced: 10.0.15063)
    case architecture1
    ///	Indicates a query for the level of support for depth-bounds tests and programmable sample positions. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS2.
    @available(Windows, introduced: 10.0.16299)//Possibly available earlier
    case options2
    ///	Indicates a query for the level of support for shader caching. The corresponding data structure for this value is D3D12_FEATURE_DATA_SHADER_CACHE.
    @available(Windows, introduced: 10.0.16299)//Possibly available earlier
    case shaderCache
    ///	Indicates a query for the adapter's support for prioritization of different command queue types. The corresponding data structure for this value is D3D12_FEATURE_DATA_COMMAND_QUEUE_PRIORITY.
    @available(Windows, introduced: 10.0.16299)//Possibly available earlier
    case commandQueuePriority
    ///	Indicates a query for the level of support for timestamp queries, format-casting, immediate write, view instancing, and barycentrics. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS3.
    @available(Windows, introduced: 10.0.16299)
    case options3
    ///	Indicates a query for whether or not the adapter supports creating heaps from existing system memory. The corresponding data structure for this value is D3D12_FEATURE_DATA_EXISTING_HEAPS.
    @available(Windows, introduced: 10.0.16299)
    case existingHeaps
    ///	Indicates a query for the level of support for 64KB-aligned MSAA textures, cross-API sharing, and native 16-bit shader operations. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS4.
    @available(Windows, introduced: 10.0.17763)//Possibly available earlier
    case options4
    ///	Indicates a query for the level of support for heap serialization. The corresponding data structure for this value is D3D12_FEATURE_DATA_SERIALIZATION.
    @available(Windows, introduced: 10.0.17763)//Possibly available earlier
    case serialization
    ///	Indicates a query for the level of support for the sharing of resources between different adapters—for example, multiple GPUs. The corresponding data structure for this value is D3D12_FEATURE_DATA_CROSS_NODE.
    @available(Windows, introduced: 10.0.17763)//Possibly available earlier
    case crossNode
    ///	Starting with Windows 10, version 1809 (10.0; Build 17763), indicates a query for the level of support for render passes, ray tracing, and shader-resource view tier 3 tiled resources. The corresponding data structure for this value is D3D12_FEATURE_DATA_D3D12_OPTIONS5.
    @available(Windows, introduced: 10.0.17763)
    case options5
    ///	Starting with Windows 10, version 1903 (10.0; Build 18362), indicates a query for the level of support for variable-rate shading (VRS), and indicates whether or not background processing is supported. For more info, see Variable-rate shading (VRS), and the Direct3D 12 background processing spec.
    @available(Windows, introduced: 10.0.18362)
    case options6
    ///	Indicates a query for the level of support for metacommands. The corresponding data structure for this value is D3D12_FEATURE_DATA_QUERY_META_COMMAND.
    @available(Windows, introduced: 10.0.19041)//Possibly available earlier
    case queryMetaCommand
    @available(Windows, introduced: 10.0.19041)//Possibly available earlier
    case options7
    @available(Windows, introduced: 10.0.19041)//Possibly available earlier
    case protectedResourceSessionTypeCount
    @available(Windows, introduced: 10.0.19041)//Possibly available earlier
    case protectedResourceSessionTypes

    public var rawValue: RawValue {
        switch self {
        case .options:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS
        case .architecture:
            return WinSDK.D3D12_FEATURE_ARCHITECTURE
        case .featureLevels:
            return WinSDK.D3D12_FEATURE_FEATURE_LEVELS
        case .formatSupport:
            return WinSDK.D3D12_FEATURE_FORMAT_SUPPORT
        case .multisampleQualityLevels:
            return WinSDK.D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS
        case .formatInfo:
            return WinSDK.D3D12_FEATURE_FORMAT_INFO
        case .gpuVirtualAddressSupport:
            return WinSDK.D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT
        case .shaderModel:
            return WinSDK.D3D12_FEATURE_SHADER_MODEL
        case .options1:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS1
        case .protectedResourceSessionSupport:
            return WinSDK.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT
        case .rootSignature:
            return WinSDK.D3D12_FEATURE_ROOT_SIGNATURE
        case .architecture1:
            return WinSDK.D3D12_FEATURE_ARCHITECTURE1
        case .options2:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS2
        case .shaderCache:
            return WinSDK.D3D12_FEATURE_SHADER_CACHE
        case .commandQueuePriority:
            return WinSDK.D3D12_FEATURE_COMMAND_QUEUE_PRIORITY
        case .options3:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS3
        case .existingHeaps:
            return WinSDK.D3D12_FEATURE_EXISTING_HEAPS
        case .options4:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS4
        case .serialization:
            return WinSDK.D3D12_FEATURE_SERIALIZATION
        case .crossNode:
            return WinSDK.D3D12_FEATURE_CROSS_NODE
        case .options5:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS5
        case .options6:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS6
        case .queryMetaCommand:
            return WinSDK.D3D12_FEATURE_QUERY_META_COMMAND
        case .options7:
            return WinSDK.D3D12_FEATURE_D3D12_OPTIONS7
        case .protectedResourceSessionTypeCount:
            return WinSDK.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT
        case .protectedResourceSessionTypes:
            return WinSDK.D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Feature")
public typealias D3D12_FEATURE = Feature


@available(*, deprecated, renamed: "Feature.options")
public let D3D12_FEATURE_D3D12_OPTIONS = Feature.options

@available(*, deprecated, renamed: "Feature.architecture")
public let D3D12_FEATURE_ARCHITECTURE = Feature.architecture

@available(*, deprecated, renamed: "Feature.featureLevels")
public let D3D12_FEATURE_FEATURE_LEVELS = Feature.featureLevels

@available(*, deprecated, renamed: "Feature.formatSupport")
public let D3D12_FEATURE_FORMAT_SUPPORT = Feature.formatSupport

@available(*, deprecated, renamed: "Feature.multisampleQualityLevels")
public let D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS = Feature.multisampleQualityLevels

@available(*, deprecated, renamed: "Feature.formatInfo")
public let D3D12_FEATURE_FORMAT_INFO = Feature.formatInfo

@available(*, deprecated, renamed: "Feature.gpuVirtualAddressSupport")
public let D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT = Feature.gpuVirtualAddressSupport

@available(*, deprecated, renamed: "Feature.shaderModel")
public let D3D12_FEATURE_SHADER_MODEL = Feature.shaderModel

@available(*, deprecated, renamed: "Feature.options1")
public let D3D12_FEATURE_D3D12_OPTIONS1 = Feature.options1

@available(*, deprecated, renamed: "Feature.protectedResourceSessionSupport")
public let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT = Feature.protectedResourceSessionSupport

@available(*, deprecated, renamed: "Feature.rootSignature")
public let D3D12_FEATURE_ROOT_SIGNATURE = Feature.rootSignature

@available(Windows, introduced: 10.0.15063)
@available(*, deprecated, renamed: "Feature.architecture1")
public let D3D12_FEATURE_ARCHITECTURE1 = Feature.architecture1

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Feature.options2")
public let D3D12_FEATURE_D3D12_OPTIONS2 = Feature.options2

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Feature.shaderCache")
public let D3D12_FEATURE_SHADER_CACHE = Feature.shaderCache

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Feature.commandQueuePriority")
public let D3D12_FEATURE_COMMAND_QUEUE_PRIORITY = Feature.commandQueuePriority

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Feature.options3")
public let D3D12_FEATURE_D3D12_OPTIONS3 = Feature.options3

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Feature.existingHeaps")
public let D3D12_FEATURE_EXISTING_HEAPS = Feature.existingHeaps

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "Feature.options4")
public let D3D12_FEATURE_D3D12_OPTIONS4 = Feature.options4

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "Feature.serialization")
public let D3D12_FEATURE_SERIALIZATION = Feature.serialization

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "Feature.crossNode")
public let D3D12_FEATURE_CROSS_NODE = Feature.crossNode

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "Feature.options5")
public let D3D12_FEATURE_D3D12_OPTIONS5 = Feature.options5

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "Feature.options6")
public let D3D12_FEATURE_D3D12_OPTIONS6 = Feature.options6

@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Feature.queryMetaCommand")
public let D3D12_FEATURE_QUERY_META_COMMAND = Feature.queryMetaCommand
    
@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Feature.options7")
public let D3D12_FEATURE_D3D12_OPTIONS7 = Feature.options7
    
@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Feature.protectedResourceSessionTypeCount")
public let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT = Feature.protectedResourceSessionTypeCount
    
@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Feature.protectedResourceSessionTypes")
public let D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES = Feature.protectedResourceSessionTypes

#endif
