/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the state of a resource regarding how the resource is being used.
public struct ResourceStates: OptionSet {
    public typealias RawType = WinSDK.D3D12_RESOURCE_STATES
    public let rawValue: Int32

    /**
    Your application should transition to this state only for accessing a resource across different graphics engine types.

    Specifically, a resource must be in the COMMON state before being used on a COPY queue (when previous used on DIRECT/COMPUTE), and before being used on DIRECT/COMPUTE (when previously used on COPY). This restriction does not exist when accessing data between DIRECT and COMPUTE queues.

    The COMMON state can be used for all usages on a Copy queue using the implicit state transitions. For more info, in Multi-engine synchronization, find "common".

    Additionally, textures must be in the COMMON state for CPU access to be legal, assuming the texture was created in a CPU-visible heap in the first place.
    */
    static let common = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_COMMON.rawValue)
    ///	A subresource must be in this state when it is accessed by the GPU as a vertex buffer or constant buffer. This is a read-only state.
    static let vertexAndConstantBuffer = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER.rawValue)
    ///	A subresource must be in this state when it is accessed by the 3D pipeline as an index buffer. This is a read-only state.
    static let indexBuffer = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_INDEX_BUFFER.rawValue)
    /// The resource is used as a render target. A subresource must be in this state when it is rendered to or when it is cleared with ID3D12GraphicsCommandList::ClearRenderTargetView.
    /// This is a write-only state. To read from a render target as a shader resource the resource must be in either D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE or D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE.
    static let rendertarget = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_RENDER_TARGET.rawValue)
    ///	The resource is used for unordered access. A subresource must be in this state when it is accessed by the GPU via an unordered access view. A subresource must also be in this state when it is cleared with ID3D12GraphicsCommandList::ClearUnorderedAccessViewInt or ID3D12GraphicsCommandList::ClearUnorderedAccessViewFloat. This is a read/write state.
    static let unorderedAccess = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_UNORDERED_ACCESS.rawValue)
    ///	D3D12_RESOURCE_STATE_DEPTH_WRITE is a state that is mutually exclusive with other states. You should use it for ID3D12GraphicsCommandList::ClearDepthStencilView when the flags (see D3D12_CLEAR_FLAGS) indicate a given subresource should be cleared (otherwise the subresource state doesn't matter), or when using it in a writable depth stencil view (see D3D12_DSV_FLAGS) when the PSO has depth write enabled (see D3D12_DEPTH_STENCIL_DESC).
    static let depthWrite = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_DEPTH_WRITE.rawValue)
    ///	DEPTH_READ is a state which can be combined with other states. It should be used when the subresource is in a read-only depth stencil view, or when the DepthEnable parameter of D3D12_DEPTH_STENCIL_DESC is false. It can be combined with other read states (for example, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE), such that the resource can be used for the depth or stencil test, and accessed by a shader within the same draw call. Using it when depth will be written by a draw call or clear command is invalid.
    static let depthRead = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_DEPTH_READ.rawValue)
    ///	The resource is used with a shader other than the pixel shader. A subresource must be in this state before being read by any stage (except for the pixel shader stage) via a shader resource view. You can still use the resource in a pixel shader with this flag as long as it also has the flag D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE set. This is a read-only state.
    static let nonPixelShaderResource = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE.rawValue)
    ///	The resource is used with a pixel shader. A subresource must be in this state before being read by the pixel shader via a shader resource view. This is a read-only state.
    static let pixelShaderResource = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE.rawValue)
    ///	The resource is used with stream output. A subresource must be in this state when it is accessed by the 3D pipeline as a stream-out target. This is a write-only state.
    static let streamOut = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_STREAM_OUT.rawValue)
    /// The resource is used as an indirect argument.
    /// Subresources must be in this state when they are used as the argument buffer passed to the indirect drawing method ID3D12GraphicsCommandList::ExecuteIndirect.
    /// This is a read-only state.
    static let indirectArgument = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT.rawValue)
    ///	The resource is used as the destination in a copy operation.
    /// Subresources must be in this state when they are used as the destination of copy operation, or a blt operation.
    /// This is a write-only state.
    static let copyDestination = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_COPY_DEST.rawValue)
    ///	The resource is used as the source in a copy operation.
    /// Subresources must be in this state when they are used as the source of copy operation, or a blt operation.
    /// This is a read-only state.
    static let copySource = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_COPY_SOURCE.rawValue)
    ///	The resource is used as the destination in a resolve operation.
    static let resolveOperationDestination = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_RESOLVE_DEST.rawValue)
    ///	The resource is used as the source in a resolve operation.
    static let resolveOperationSource = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_RESOLVE_SOURCE.rawValue)
    ///	When a buffer is created with this as its initial state, it indicates that the resource is a raytracing acceleration structure, for use in ID3D12GraphicsCommandList4::BuildRaytracingAccelerationStructure, ID3D12GraphicsCommandList4::CopyRaytracingAccelerationStructure, or ID3D12Device::CreateShaderResourceView for the D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE dimension.
    static let raytracingAccelerationStructure = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE.rawValue)
    ///	Starting with Windows 10, version 1903 (10.0; Build 18362), indicates that the resource is a screen-space shading-rate image for variable-rate shading (VRS). For more info, see Variable-rate shading (VRS).
    static let shadingRateSource = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_SHADING_RATE_SOURCE.rawValue)
    ///	D3D12_RESOURCE_STATE_GENERIC_READ is a logically OR'd combination of other read-state bits. This is the required starting state for an upload heap. Your application should generally avoid transitioning to D3D12_RESOURCE_STATE_GENERIC_READ when possible, since that can result in premature cache flushes, or resource layout changes (for example, compress/decompress), causing unnecessary pipeline stalls. You should instead transition resources only to the actually-used states.
    static let genericRead = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_GENERIC_READ.rawValue)
    ///	Synonymous with D3D12_RESOURCE_STATE_COMMON.
    static let present = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_PRESENT.rawValue)
    ///	The resource is used for Predication.
    static let predication = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_PREDICATION.rawValue)
    ///	The resource is used as a source in a decode operation. Examples include reading the compressed bitstream and reading from decode references,
    static let videoDecodeRead = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_DECODE_READ.rawValue)
    ///	The resource is used as a destination in the decode operation. This state is used for decode output and histograms.
    static let videoDecodeWrite = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_DECODE_WRITE.rawValue)
    ///	The resource is used to read video data during video processing; that is, the resource is used as the source in a processing operation such as video encoding (compression).
    static let videoProcessRead = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_PROCESS_READ.rawValue)
    ///	The resource is used to write video data during video processing; that is, the resource is used as the destination in a processing operation such as video encoding (compression).
    static let videoProcessWrite = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_PROCESS_WRITE.rawValue)
    ///	The resource is used as the source in an encode operation. This state is used for the input and reference of motion estimation.
    static let videoEncodeRead = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_ENCODE_READ.rawValue)
    ///	This resource is used as the destination in an encode operation. This state is used for the destination texture of a resolve motion vector heap operation.
    static let videoEncodeWrite = ResourceStates(rawValue: WinSDK.D3D12_RESOURCE_STATE_VIDEO_ENCODE_WRITE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceStates")
public typealias D3D12_RESOURCE_STATES = ResourceStates

public extension ResourceStates {
    @available(*, deprecated, renamed: "common")
    static let D3D12_RESOURCE_STATE_COMMON = Self.common

    @available(*, deprecated, renamed: "vertexAndConstantBuffer")
    static let D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER = Self.vertexAndConstantBuffer

    @available(*, deprecated, renamed: "indexBuffer")
    static let D3D12_RESOURCE_STATE_INDEX_BUFFER = Self.indexBuffer

    @available(*, deprecated, renamed: "rendertarget")
    static let D3D12_RESOURCE_STATE_RENDER_TARGET = Self.rendertarget

    @available(*, deprecated, renamed: "unorderedAccess")
    static let D3D12_RESOURCE_STATE_UNORDERED_ACCESS = Self.unorderedAccess

    @available(*, deprecated, renamed: "depthWrite")
    static let D3D12_RESOURCE_STATE_DEPTH_WRITE = Self.depthWrite

    @available(*, deprecated, renamed: "depthRead")
    static let D3D12_RESOURCE_STATE_DEPTH_READ = Self.depthRead

    @available(*, deprecated, renamed: "nonPixelShaderResource")
    static let D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE = Self.nonPixelShaderResource

    @available(*, deprecated, renamed: "pixelShaderResource")
    static let D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE = Self.pixelShaderResource

    @available(*, deprecated, renamed: "streamOut")
    static let D3D12_RESOURCE_STATE_STREAM_OUT = Self.streamOut

    @available(*, deprecated, renamed: "indirectArgument")
    static let D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT = Self.indirectArgument

    @available(*, deprecated, renamed: "copyDestination")
    static let D3D12_RESOURCE_STATE_COPY_DEST = Self.copyDestination

    @available(*, deprecated, renamed: "copySource")
    static let D3D12_RESOURCE_STATE_COPY_SOURCE = Self.copySource
 
    @available(*, deprecated, renamed: "resolveOperationDestination")
    static let D3D12_RESOURCE_STATE_RESOLVE_DEST = Self.resolveOperationDestination

    @available(*, deprecated, renamed: "resolveOperationSource")
    static let D3D12_RESOURCE_STATE_RESOLVE_SOURCE = Self.resolveOperationSource

    @available(*, deprecated, renamed: "raytracingAccelerationStructure")
    static let D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE = Self.raytracingAccelerationStructure

    @available(*, deprecated, renamed: "shadingRateSource")
    static let D3D12_RESOURCE_STATE_SHADING_RATE_SOURCE = Self.shadingRateSource

    @available(*, deprecated, renamed: "genericRead")
    static let D3D12_RESOURCE_STATE_GENERIC_READ = Self.genericRead

    @available(*, deprecated, renamed: "present")
    static let D3D12_RESOURCE_STATE_PRESENT = Self.present

    @available(*, deprecated, renamed: "predication")
    static let D3D12_RESOURCE_STATE_PREDICATION = Self.predication

    @available(*, deprecated, renamed: "videoDecodeRead")
    static let D3D12_RESOURCE_STATE_VIDEO_DECODE_READ = Self.videoDecodeRead

    @available(*, deprecated, renamed: "videoDecodeWrite")
    static let D3D12_RESOURCE_STATE_VIDEO_DECODE_WRITE = Self.videoDecodeWrite

    @available(*, deprecated, renamed: "videoProcessRead")
    static let D3D12_RESOURCE_STATE_VIDEO_PROCESS_READ = Self.videoProcessRead

    @available(*, deprecated, renamed: "videoProcessWrite")
    static let D3D12_RESOURCE_STATE_VIDEO_PROCESS_WRITE = Self.videoProcessWrite

    @available(*, deprecated, renamed: "videoEncodeRead")
    static let D3D12_RESOURCE_STATE_VIDEO_ENCODE_READ = Self.videoEncodeRead

    @available(*, deprecated, renamed: "videoEncodeWrite")
    static let D3D12_RESOURCE_STATE_VIDEO_ENCODE_WRITE = Self.videoEncodeWrite
}

#endif
