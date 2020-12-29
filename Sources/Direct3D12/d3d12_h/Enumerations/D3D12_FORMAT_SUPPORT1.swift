/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies resources that are supported for a provided format.
public enum FormatSupport1 {
    ///	No resources are supported.
    case none
    ///	Buffer resources supported.
    case buffer
    ///	Vertex buffers supported.
    case vertexBuffer
    ///	Index buffers supported.
    case indexBuffer
    ///	Streaming output buffers supported.
    case streamingOutputBuffer
    ///	1D texture resources supported.
    case texture1D
    ///	2D texture resources supported.
    case texture2D
    ///	3D texture resources supported.
    case texture3D
    ///	Cube texture resources supported.
    case textureCube
    ///	The HLSL Load function for texture objects is supported.
    case shaderLoad
    /// The HLSL Sample function for texture objects is supported.
    /// -Note: If the device supports the format as a resource (1D, 2D, 3D, or cube map) but doesn't support this option, the resource can still use the Sample method but must use only the point filtering sampler state to perform the sample.
    case shaderSample
    ///	The HLSL SampleCmp and SampleCmpLevelZero functions for texture objects are supported.
    /// -Note: Windows 8 and later might provide limited support for these functions on Direct3D feature levels 9_1, 9_2, and 9_3. For more info, see Implementing shadow buffers for Direct3D feature level 9.
    case shaderSampleComparison
    ///	Reserved.
    case sampleMonoText
    ///	Mipmaps are supported.
    case mipmap
    ///	Render targets are supported.
    case renderTarget
    ///	Blend operations supported.
    case blendOperation
    ///	Depth stencils supported.
    case depthStencil
    ///	Multisample antialiasing (MSAA) resolve operations are supported. For more info, see ID3D12GraphicsCommandList::ResolveSubresource.
    case multisampleResolve
    ///	Format can be displayed on screen.
    case display
    ///	Format can't be cast to another format.
    case castWithinBitLayout
    ///	Format can be used as a multi-sampled render target.
    case multisampleRenderTarget
    ///	Format can be used as a multi-sampled texture and read into a shader with the HLSL Load function.
    case multisampleLoad
    ///	Format can be used with the HLSL gather function. This value is available in DirectX 10.1 or higher.
    case shaderGather
    ///	Format supports casting when the resource is a back buffer.
    case backBufferCast
    ///	Format can be used for an unordered access view.
    case unorderedAccessView
    ///	Format can be used with the HLSL gather with comparison function.
    case shaderGatherComparison
    ///	Format can be used with the decoder output.
    case decoderOutput
    ///	Format can be used with the video processor output.
    case videoProcessorOutput
    ///	Format can be used with the video processor input.
    case videoProcessorInput
    ///	Format can be used with the video encoder.
    case videoEncode

    internal var rawValue: _d3d12.D3D12_FORMAT_SUPPORT1 {
        switch self {
    case .none:
        return _d3d12.D3D12_FORMAT_SUPPORT1_NONE
    case .buffer:
        return _d3d12.D3D12_FORMAT_SUPPORT1_BUFFER
    case .vertexBuffer:
        return _d3d12.D3D12_FORMAT_SUPPORT1_IA_VERTEX_BUFFER
    case .indexBuffer:
        return _d3d12.D3D12_FORMAT_SUPPORT1_IA_INDEX_BUFFER
    case .streamingOutputBuffer:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SO_BUFFER
    case .texture1D:
        return _d3d12.D3D12_FORMAT_SUPPORT1_TEXTURE1D
    case .texture2D:
        return _d3d12.D3D12_FORMAT_SUPPORT1_TEXTURE2D
    case .texture3D:
        return _d3d12.D3D12_FORMAT_SUPPORT1_TEXTURE3D
    case .textureCube:
        return _d3d12.D3D12_FORMAT_SUPPORT1_TEXTURECUBE
    case .shaderLoad:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_LOAD
    case .shaderSample:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE
    case .shaderSampleComparison:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_COMPARISON
    case .sampleMonoText:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_MONO_TEXT
    case .mipmap:
        return _d3d12.D3D12_FORMAT_SUPPORT1_MIP
    case .renderTarget:
        return _d3d12.D3D12_FORMAT_SUPPORT1_RENDER_TARGET
    case .blendOperation:
        return _d3d12.D3D12_FORMAT_SUPPORT1_BLENDABLE
    case .depthStencil:
        return _d3d12.D3D12_FORMAT_SUPPORT1_DEPTH_STENCIL
    case .multisampleResolve:
        return _d3d12.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RESOLVE
    case .display:
        return _d3d12.D3D12_FORMAT_SUPPORT1_DISPLAY
    case .castWithinBitLayout:
        return _d3d12.D3D12_FORMAT_SUPPORT1_CAST_WITHIN_BIT_LAYOUT
    case .multisampleRenderTarget:
        return _d3d12.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RENDERTARGET
    case .multisampleLoad:
        return _d3d12.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_LOAD
    case .shaderGather:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_GATHER
    case .backBufferCast:
        return _d3d12.D3D12_FORMAT_SUPPORT1_BACK_BUFFER_CAST
    case .unorderedAccessView:
        return _d3d12.D3D12_FORMAT_SUPPORT1_TYPED_UNORDERED_ACCESS_VIEW
    case .shaderGatherComparison:
        return _d3d12.D3D12_FORMAT_SUPPORT1_SHADER_GATHER_COMPARISON
    case .decoderOutput:
        return _d3d12.D3D12_FORMAT_SUPPORT1_DECODER_OUTPUT
    case .videoProcessorOutput:
        return _d3d12.D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_OUTPUT
    case .videoProcessorInput:
        return _d3d12.D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_INPUT
    case .videoEncode:
        return _d3d12.D3D12_FORMAT_SUPPORT1_VIDEO_ENCODER
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FormatSupport1")
public typealias D3D12_FORMAT_SUPPORT1 = FormatSupport1

public extension FormatSupport1   {
    @available(*, deprecated, renamed: "none")
    static let D3D12_FORMAT_SUPPORT1_NONE = Self.none

    @available(*, deprecated, renamed: "buffer")
    static let D3D12_FORMAT_SUPPORT1_BUFFER = Self.buffer

    @available(*, deprecated, renamed: "vertexBuffer")
    static let D3D12_FORMAT_SUPPORT1_IA_VERTEX_BUFFER = Self.vertexBuffer

    @available(*, deprecated, renamed: "indexBuffer")
    static let D3D12_FORMAT_SUPPORT1_IA_INDEX_BUFFER = Self.indexBuffer

    @available(*, deprecated, renamed: "streamingOutputBuffer")
    static let D3D12_FORMAT_SUPPORT1_SO_BUFFER = Self.streamingOutputBuffer

    @available(*, deprecated, renamed: "texture1D")
    static let D3D12_FORMAT_SUPPORT1_TEXTURE1D = Self.texture1D

    @available(*, deprecated, renamed: "texture2D")
    static let D3D12_FORMAT_SUPPORT1_TEXTURE2D = Self.texture2D

    @available(*, deprecated, renamed: "texture3D")
    static let D3D12_FORMAT_SUPPORT1_TEXTURE3D = Self.texture3D

    @available(*, deprecated, renamed: "textureCube")
    static let D3D12_FORMAT_SUPPORT1_TEXTURECUBE = Self.textureCube

    @available(*, deprecated, renamed: "shaderLoad")
    static let D3D12_FORMAT_SUPPORT1_SHADER_LOAD = Self.shaderLoad

    @available(*, deprecated, renamed: "shaderSample")
    static let D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE = Self.shaderSample

    @available(*, deprecated, renamed: "shaderSampleComparison")
    static let D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_COMPARISON = Self.shaderSampleComparison

    @available(*, deprecated, renamed: "sampleMonoText")
    static let D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_MONO_TEXT = Self.sampleMonoText

    @available(*, deprecated, renamed: "mipmap")
    static let D3D12_FORMAT_SUPPORT1_MIP = Self.mipmap

    @available(*, deprecated, renamed: "renderTarget")
    static let D3D12_FORMAT_SUPPORT1_RENDER_TARGET = Self.renderTarget

    @available(*, deprecated, renamed: "blendOperation")
    static let D3D12_FORMAT_SUPPORT1_BLENDABLE = Self.blendOperation

    @available(*, deprecated, renamed: "depthStencil")
    static let D3D12_FORMAT_SUPPORT1_DEPTH_STENCIL = Self.depthStencil

    @available(*, deprecated, renamed: "multisampleResolve")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RESOLVE = Self.multisampleResolve

    @available(*, deprecated, renamed: "display")
    static let D3D12_FORMAT_SUPPORT1_DISPLAY = Self.display

    @available(*, deprecated, renamed: "castWithinBitLayout")
    static let D3D12_FORMAT_SUPPORT1_CAST_WITHIN_BIT_LAYOUT = Self.castWithinBitLayout

    @available(*, deprecated, renamed: "multisampleRenderTarget")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RENDERTARGET = Self.multisampleRenderTarget

    @available(*, deprecated, renamed: "multisampleLoad")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_LOAD = Self.multisampleLoad

    @available(*, deprecated, renamed: "shaderGather")
    static let D3D12_FORMAT_SUPPORT1_SHADER_GATHER = Self.shaderGather

    @available(*, deprecated, renamed: "backBufferCast")
    static let D3D12_FORMAT_SUPPORT1_BACK_BUFFER_CAST = Self.backBufferCast

    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_FORMAT_SUPPORT1_TYPED_UNORDERED_ACCESS_VIEW = Self.unorderedAccessView

    @available(*, deprecated, renamed: "shaderGatherComparison")
    static let D3D12_FORMAT_SUPPORT1_SHADER_GATHER_COMPARISON = Self.shaderGatherComparison

    @available(*, deprecated, renamed: "decoderOutput")
    static let D3D12_FORMAT_SUPPORT1_DECODER_OUTPUT = Self.decoderOutput

    @available(*, deprecated, renamed: "videoProcessorOutput")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_OUTPUT = Self.videoProcessorOutput

    @available(*, deprecated, renamed: "videoProcessorInput")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_INPUT = Self.videoProcessorInput

    @available(*, deprecated, renamed: "videoEncode")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_ENCODER = Self.videoEncode
}

#endif
