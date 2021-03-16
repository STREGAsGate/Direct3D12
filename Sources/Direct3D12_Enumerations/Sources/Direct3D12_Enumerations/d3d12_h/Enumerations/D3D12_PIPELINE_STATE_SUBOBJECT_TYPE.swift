/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of a sub-object in a pipeline state stream description.
public enum PipelineStateSubobjectType {
    ///	Indicates a root signature subobject type.
    case rootSignature
    ///	Indicates a vertex shader subobject type.
    case vertexShader
    ///	Indicates a pixel shader subobject type.
    case pixelShader
    ///	Indicates a domain shader subobject type.
    case domainShader
    ///	Indicates a hull shader subobject type.
    case hullShader
    ///	Indicates a geometry shader subobject type.
    case geometryShader
    ///	Indicates a compute shader subobject type.
    case computeShader
    ///	Indicates a stream-output subobject type.
    case streamOutput
    ///	Indicates a blend subobject type.
    case blend
    ///	Indicates a sample mask subobject type.
    case sampleMask
    ///	Indicates indicates a rasterizer subobject type.
    case rasterizer
    ///	Indicates a depth stencil subobject type.
    case depthStencil
    ///	Indicates an input layout subobject type.
    case inputLayout
    ///	Indicates an index buffer strip cut value subobject type.
    case indexBufferStripCut
    ///	Indicates a primitive topology subobject type.
    case primitiveTopology
    ///	Indicates a render target formats subobject type. This subobject type corresponds to the D3D12_RT_FORMAT_ARRAY structure, which wraps an array of render target formats along with a count of the array elements.
    case renderTargetFormats
    ///	Indicates a depth stencil format subobject.
    case depthStencilFormat
    ///	Indicates a sample description subobject type.
    case sampleDescription
    ///	Indicates a node mask subobject type.
    case nodeMask
    ///	Indicates a cached pipeline state object subobject type.
    case chachedPipelineStateObject
    ///	Indicates a flags subobject type.
    case flags
    ///	Indicates an expanded depth stencil subobject type. This expansion of the depth stencil subobject supports optional depth bounds checking.
    case depthStencilExpanded
    ///	Indicates a view instancing subobject type.
    case viewInstancing
    ///	Indicates an amplification shader subobject type.
    case amplificationShader
    ///	Indicates a mesh shader subobject type.
    case meshShader
    ///	A sentinal value that marks the exclusive upper-bound of valid values this enumeration represents.
    case maxValid

    internal var rawValue: WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE {
        switch self {
        case .rootSignature:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_ROOT_SIGNATURE
        case .vertexShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VS
        case .pixelShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PS
        case .domainShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DS
        case .hullShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_HS
        case .geometryShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_GS
        case .computeShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CS
        case .streamOutput:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_STREAM_OUTPUT
        case .blend:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_BLEND
        case .sampleMask:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_MASK
        case .rasterizer:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER
        case .depthStencil:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL
        case .inputLayout:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_INPUT_LAYOUT
        case .indexBufferStripCut:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_IB_STRIP_CUT_VALUE
        case .primitiveTopology:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PRIMITIVE_TOPOLOGY
        case .renderTargetFormats:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RENDER_TARGET_FORMATS
        case .depthStencilFormat:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL_FORMAT
        case .sampleDescription:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_DESC
        case .nodeMask:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_NODE_MASK
        case .chachedPipelineStateObject:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CACHED_PSO
        case .flags:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_FLAGS
        case .depthStencilExpanded:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL1
        case .viewInstancing:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VIEW_INSTANCING
        case .amplificationShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_AS
        case .meshShader:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MS
        case .maxValid:
            return WinSDK.D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MAX_VALID
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PipelineStateSubobjectType")
public typealias D3D12_PIPELINE_STATE_SUBOBJECT_TYPE = PipelineStateSubobjectType

public extension PipelineStateSubobjectType  {
    @available(*, deprecated, renamed: "rootSignature")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_ROOT_SIGNATURE = Self.rootSignature

    @available(*, deprecated, renamed: "vertexShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VS = Self.vertexShader

    @available(*, deprecated, renamed: "pixelShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PS = Self.pixelShader

    @available(*, deprecated, renamed: "domainShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DS = Self.domainShader

    @available(*, deprecated, renamed: "hullShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_HS = Self.hullShader

    @available(*, deprecated, renamed: "geometryShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_GS = Self.geometryShader

    @available(*, deprecated, renamed: "computeShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CS = Self.computeShader

    @available(*, deprecated, renamed: "streamOutput")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_STREAM_OUTPUT = Self.streamOutput

    @available(*, deprecated, renamed: "blend")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_BLEND = Self.blend

    @available(*, deprecated, renamed: "sampleMask")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_MASK = Self.sampleMask

    @available(*, deprecated, renamed: "rasterizer")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER = Self.rasterizer

    @available(*, deprecated, renamed: "depthStencil")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL = Self.depthStencil

    @available(*, deprecated, renamed: "inputLayout")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_INPUT_LAYOUT = Self.inputLayout

    @available(*, deprecated, renamed: "indexBufferStripCut")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_IB_STRIP_CUT_VALUE = Self.indexBufferStripCut

    @available(*, deprecated, renamed: "primitiveTopology")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PRIMITIVE_TOPOLOGY = Self.primitiveTopology

    @available(*, deprecated, renamed: "renderTargetFormats")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RENDER_TARGET_FORMATS = Self.renderTargetFormats

    @available(*, deprecated, renamed: "depthStencilFormat")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL_FORMAT = Self.depthStencilFormat

    @available(*, deprecated, renamed: "sampleDescription")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_SAMPLE_DESC = Self.sampleDescription

    @available(*, deprecated, renamed: "nodeMask")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_NODE_MASK = Self.nodeMask

    @available(*, deprecated, renamed: "chachedPipelineStateObject")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_CACHED_PSO = Self.chachedPipelineStateObject

    @available(*, deprecated, renamed: "flags")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_FLAGS = Self.flags

    @available(*, deprecated, renamed: "depthStencilExpanded")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_DEPTH_STENCIL1 = Self.depthStencilExpanded

    @available(*, deprecated, renamed: "viewInstancing")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_VIEW_INSTANCING = Self.viewInstancing

    @available(*, deprecated, renamed: "amplificationShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_AS = Self.amplificationShader

    @available(*, deprecated, renamed: "meshShader")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MS = Self.meshShader

    @available(*, deprecated, renamed: "maxValid")
    static let D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_MAX_VALID = Self.maxValid
}

#endif
