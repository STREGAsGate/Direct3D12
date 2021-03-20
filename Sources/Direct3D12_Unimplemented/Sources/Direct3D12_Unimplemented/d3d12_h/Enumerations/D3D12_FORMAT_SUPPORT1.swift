/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies resources that are supported for a provided format.
public struct FormatSupport1: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No resources are supported.
    //static let none = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_NONE.rawValue)

    ///	Buffer resources supported.
    static let buffer = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_BUFFER.rawValue)
    ///	Vertex buffers supported.
    static let iaVertexBuffer = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_IA_VERTEX_BUFFER.rawValue)
    ///	Index buffers supported.
    static let iaIndexBuffer = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_IA_INDEX_BUFFER.rawValue)
    ///	Streaming output buffers supported.
    static let streamingOutputBuffer = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SO_BUFFER.rawValue)
    ///	1D texture resources supported.
    static let texture1D = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_TEXTURE1D.rawValue)
    ///	2D texture resources supported.
    static let texture2D = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_TEXTURE2D.rawValue)
    ///	3D texture resources supported.
    static let texture3D = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_TEXTURE3D.rawValue)
    ///	Cube texture resources supported.
    static let textureCube = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_TEXTURECUBE.rawValue)
    ///	The HLSL Load function for texture objects is supported.
    static let shaderLoad = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SHADER_LOAD.rawValue)	
    /**The HLSL Sample function for texture objects is supported.

    Note  If the device supports the format as a resource (1D, 2D, 3D, or cube map) but doesn't support this option, the resource can still use the Sample method but must use only the point filtering sampler state to perform the sample.

    
    D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_COMPARISON	The HLSL SampleCmp and SampleCmpLevelZero functions for texture objects are supported.

    Note  Windows 8 and later might provide limited support for these functions on Direct3D feature levels 9_1, 9_2, and 9_3. For more info, see Implementing shadow buffers for Direct3D feature level 9.
    */
    static let shaderSample = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE.rawValue) 
    ///	Reserved.
    static let shaderSampleMonoText = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_MONO_TEXT.rawValue)
    ///	Mipmaps are supported.
    static let mip = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_MIP.rawValue)
    ///	Render targets are supported.
    static let renderTarget = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_RENDER_TARGET.rawValue)
    ///	Blend operations supported.
    static let blendable = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_BLENDABLE.rawValue)
    ///	Depth stencils supported.
    static let depthStencil = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_DEPTH_STENCIL.rawValue)
    ///	Multisample antialiasing (MSAA) resolve operations are supported. For more info, see ID3D12GraphicsCommandList::ResolveSubresource.
    static let multisampleResolve = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RESOLVE.rawValue)
    ///	Format can be displayed on screen.
    static let display = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_DISPLAY.rawValue)
    ///	Format can't be cast to another format.
    static let castWithinBitLayout = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_CAST_WITHIN_BIT_LAYOUT.rawValue)
    ///	Format can be used as a multi-sampled render target.
    static let multisampleRendertarget = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RENDERTARGET.rawValue)
    ///	Format can be used as a multi-sampled texture and read into a shader with the HLSL Load function.
    static let multisampleLoad = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_MULTISAMPLE_LOAD.rawValue)
    ///	Format can be used with the HLSL gather function. This value is available in DirectX 10.1 or higher.
    static let shaderGather = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SHADER_GATHER.rawValue)
    ///	Format supports casting when the resource is a back buffer.
    static let backBufferCast = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_BACK_BUFFER_CAST.rawValue)
    ///	Format can be used for an unordered access view.
    static let typedUnorderedAccessView = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_TYPED_UNORDERED_ACCESS_VIEW.rawValue)
    ///	Format can be used with the HLSL gather with comparison function.
    static let shaderGatherComparison = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_SHADER_GATHER_COMPARISON.rawValue)
    ///	Format can be used with the decoder output.
    static let decoderOutput = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_DECODER_OUTPUT.rawValue)
    ///	Format can be used with the video processor output.
    static let videoProcessorOutput = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_OUTPUT.rawValue)
    ///	Format can be used with the video processor input.
    static let videoProcessorInput = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_INPUT.rawValue)
    ///	Format can be used with the video encoder.
    static let videoEncoder = FormatSupport1(rawValue: WinSDK.D3D12_FORMAT_SUPPORT1_VIDEO_ENCODER.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FormatSupport1")
public typealias D3D12_FORMAT_SUPPORT1 = FormatSupport1

public extension FormatSupport1 {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_FORMAT_SUPPORT1_NONE: FormatSupport1 = []

    @available(*, deprecated, renamed: "buffer")
    static let D3D12_FORMAT_SUPPORT1_BUFFER = Self.buffer
    
    @available(*, deprecated, renamed: "iaVertexBuffer")
    static let D3D12_FORMAT_SUPPORT1_IA_VERTEX_BUFFER = Self.iaVertexBuffer
    
    @available(*, deprecated, renamed: "iaIndexBuffer")
    static let D3D12_FORMAT_SUPPORT1_IA_INDEX_BUFFER = Self.iaIndexBuffer
    
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
    
    @available(*, deprecated, renamed: "shaderSampleMonoText")
    static let D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE_MONO_TEXT = Self.shaderSampleMonoText
    
    @available(*, deprecated, renamed: "mip")
    static let D3D12_FORMAT_SUPPORT1_MIP = Self.mip
    
    @available(*, deprecated, renamed: "renderTarget")
    static let D3D12_FORMAT_SUPPORT1_RENDER_TARGET = Self.renderTarget
    
    @available(*, deprecated, renamed: "blendable")
    static let D3D12_FORMAT_SUPPORT1_BLENDABLE = Self.blendable
    
    @available(*, deprecated, renamed: "depthStencil")
    static let D3D12_FORMAT_SUPPORT1_DEPTH_STENCIL = Self.depthStencil
    
    @available(*, deprecated, renamed: "multisampleResolve")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RESOLVE = Self.multisampleResolve
    
    @available(*, deprecated, renamed: "display")
    static let D3D12_FORMAT_SUPPORT1_DISPLAY = Self.display
    
    @available(*, deprecated, renamed: "castWithinBitLayout")
    static let D3D12_FORMAT_SUPPORT1_CAST_WITHIN_BIT_LAYOUT = Self.castWithinBitLayout
    
    @available(*, deprecated, renamed: "multisampleRendertarget")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_RENDERTARGET = Self.multisampleRendertarget
    
    @available(*, deprecated, renamed: "multisampleLoad")
    static let D3D12_FORMAT_SUPPORT1_MULTISAMPLE_LOAD = Self.multisampleLoad
    
    @available(*, deprecated, renamed: "shaderGather")
    static let D3D12_FORMAT_SUPPORT1_SHADER_GATHER = Self.shaderGather
    
    @available(*, deprecated, renamed: "backBufferCast")
    static let D3D12_FORMAT_SUPPORT1_BACK_BUFFER_CAST = Self.backBufferCast
    
    @available(*, deprecated, renamed: "typedUnorderedAccessView")
    static let D3D12_FORMAT_SUPPORT1_TYPED_UNORDERED_ACCESS_VIEW = Self.typedUnorderedAccessView
    
    @available(*, deprecated, renamed: "shaderGatherComparison")
    static let D3D12_FORMAT_SUPPORT1_SHADER_GATHER_COMPARISON = Self.shaderGatherComparison
    
    @available(*, deprecated, renamed: "decoderOutput")
    static let D3D12_FORMAT_SUPPORT1_DECODER_OUTPUT = Self.decoderOutput
    
    @available(*, deprecated, renamed: "videoProcessorOutput")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_OUTPUT = Self.videoProcessorOutput
    
    @available(*, deprecated, renamed: "videoProcessorInput")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_PROCESSOR_INPUT = Self.videoProcessorInput
    
    @available(*, deprecated, renamed: "videoEncoder")
    static let D3D12_FORMAT_SUPPORT1_VIDEO_ENCODER = Self.videoEncoder
}

#endif
