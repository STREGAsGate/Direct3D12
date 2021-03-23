/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes a graphics pipeline state object.
public struct D3DGraphicsPipelineStateDescription {
    public typealias RawValue = WinSDK.D3D12_GRAPHICS_PIPELINE_STATE_DESC
    internal var rawValue: RawValue

    /// A pointer to the ID3D12RootSignature object.
    public var rootSignature: D3DRootSignature {
        get {
            return D3DRootSignature(win32Pointer: rawValue.pRootSignature)
        }
        set {
            rawValue.pRootSignature = newValue.performFatally(as: D3DRootSignature.RawValue.self){$0}
        }
    }

    /// A D3D12_SHADER_BYTECODE structure that describes the vertex shader.
    public var vertexShader: D3DShaderBytecode {
        get {
            return D3DShaderBytecode(rawValue.VS)
        }
        set {
            rawValue.VS = newValue.rawValue
        }
    }

    /// A D3D12_SHADER_BYTECODE structure that describes the pixel shader.
    public var pixelShader: D3DShaderBytecode {
        get {
            return D3DShaderBytecode(rawValue.PS)
        }
        set {
            rawValue.PS = newValue.rawValue
        }
    }

    /// A D3D12_SHADER_BYTECODE structure that describes the domain shader.
    public var domainShader: D3DShaderBytecode {
        get {
            return D3DShaderBytecode(rawValue.DS)
        }
        set {
            rawValue.DS = newValue.rawValue
        }
    }

    /// A D3D12_SHADER_BYTECODE structure that describes the hull shader.
    public var hullShader: D3DShaderBytecode {
        get {
            return D3DShaderBytecode(rawValue.HS)
        }
        set {
            rawValue.HS = newValue.rawValue
        }
    }

    /// A D3D12_SHADER_BYTECODE structure that describes the geometry shader.
    public var geometryShader: D3DShaderBytecode {
        get {
            return D3DShaderBytecode(rawValue.GS)
        }
        set {
            rawValue.GS = newValue.rawValue
        }
    }

    /// A D3D12_STREAM_OUTPUT_DESC structure that describes a streaming output buffer.
    public var streamOutput: D3DStreamOutputDescriptor {
        get {
            return D3DStreamOutputDescriptor(rawValue.StreamOutput)
        }
        set {
            rawValue.StreamOutput = newValue.rawValue
        }
    }

    /// A D3D12_BLEND_DESC structure that describes the blend state.
    public var blendState: D3DBlendDescription {
        get {
            return D3DBlendDescription(rawValue.BlendState)
        }
        set {
            rawValue.BlendState = newValue.rawValue
        }
    }

    /// The sample mask for the blend state.
    public var sampleMask: UInt32 {
        get {
            return rawValue.SampleMask
        }
        set {
            rawValue.SampleMask = newValue
        }
    }

    /// A D3D12_RASTERIZER_DESC structure that describes the rasterizer state.
    public var rasterizerState: D3DRasterizerDescription {
        get {
            return D3DRasterizerDescription(rawValue.RasterizerState)
        }
        set {
            rawValue.RasterizerState = newValue.rawValue
        }
    }

    /// A D3D12_DEPTH_STENCIL_DESC structure that describes the depth-stencil state.
    public var depthStencilState: D3DDepthStencilDescription {
        get {
            return D3DDepthStencilDescription(rawValue.DepthStencilState)
        }
        set {
            rawValue.DepthStencilState = newValue.rawValue
        }
    }

    /// A D3D12_INPUT_LAYOUT_DESC structure that describes the input-buffer data for the input-assembler stage.
    public var inputLayout: D3DInputLayoutDesription {
        get {
            return D3DInputLayoutDesription(rawValue.InputLayout)
        }
        set {
            rawValue.InputLayout = newValue.rawValue
        }
    }

    /// Specifies the properties of the index buffer in a D3D12_INDEX_BUFFER_STRIP_CUT_VALUE structure.
    public var indexBufferStripCutValue: D3DIndexBufferStripCutValue {
        get {
            return D3DIndexBufferStripCutValue(rawValue.IBStripCutValue)
        }
        set {
            rawValue.IBStripCutValue = newValue.rawValue
        }
    }

    /// A D3D12_PRIMITIVE_TOPOLOGY_TYPE-typed value for the type of primitive, and ordering of the primitive data.
    public var primitiveTopologyType: D3DPrimitiveTopologyType {
        get {
            return D3DPrimitiveTopologyType(rawValue.PrimitiveTopologyType)
        }
        set {
            rawValue.PrimitiveTopologyType = newValue.rawValue
        }
    }

    /// An array of DXGI_FORMAT-typed values for the render target formats.
    public var renderTargetFormats: [DGIFormat] {
        get {
            return withUnsafePointer(to: rawValue.RTVFormats.0) {p in
                let buffer = UnsafeBufferPointer(start: p, count: Int(rawValue.NumRenderTargets))
                return buffer.map({DGIFormat($0)})
            }
        }
        set {
            typealias Tuple = (DGIFormat.RawValue, DGIFormat.RawValue,
                               DGIFormat.RawValue, DGIFormat.RawValue,
                               DGIFormat.RawValue, DGIFormat.RawValue,
                               DGIFormat.RawValue, DGIFormat.RawValue)
            newValue.map({$0.rawValue}).withUnsafeBytes {buf in
                rawValue.RTVFormats = buf.bindMemory(to: Tuple.self)[0]  
            }
            rawValue.NumRenderTargets = UInt32(newValue.count)
        }
    }

    /// A DXGI_FORMAT-typed value for the depth-stencil format.
    public var depthStencilFormat: DGIFormat {
        get {
            return DGIFormat(rawValue.DSVFormat)
        }
        set {
            rawValue.DSVFormat = newValue.rawValue
        }
    }

    /// A DXGI_SAMPLE_DESC structure that specifies multisampling parameters.
    public var sampleDescription: DGISampleDescription {
        get {
            return DGISampleDescription(rawValue.SampleDesc)
        }
        set {
            rawValue.SampleDesc = newValue.rawValue
        }
    }

    /// For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to Multi-adapter systems.
    public var multipleAdapterNodeMask: UInt32 {
        get {
            return self.rawValue.NodeMask
        }
        set {
            self.rawValue.NodeMask = newValue
        }
    }

    /// A cached pipeline state object, as a D3D12_CACHED_PIPELINE_STATE structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
    public var cachedPipelineState: D3DCachedPipelineState {
        get {
            return D3DCachedPipelineState(rawValue.CachedPSO)
        }
        set {
            rawValue.CachedPSO = newValue.rawValue
        }
    }

    /// A D3D12_PIPELINE_STATE_FLAGS enumeration constant such as for "tool debug".
    public var flags: D3DPipelineStateFlags {
        get {
            return D3DPipelineStateFlags(rawValue.Flags)
        }
        set {
            rawValue.Flags = newValue.rawType
        }
    }

    /** Describes a graphics pipeline state object.
    - parameter rootSignature: A pointer to the ID3D12RootSignature object.
    - parameter vertexShader: A D3D12_SHADER_BYTECODE structure that describes the vertex shader.
    - parameter pixelShader: A D3D12_SHADER_BYTECODE structure that describes the pixel shader.
    - parameter domainShader: A D3D12_SHADER_BYTECODE structure that describes the domain shader.
    - parameter hullShader: A D3D12_SHADER_BYTECODE structure that describes the hull shader.
    - parameter geometryShader: A D3D12_SHADER_BYTECODE structure that describes the geometry shader.
    - parameter streamOutput: A D3D12_STREAM_OUTPUT_DESC structure that describes a streaming output buffer.
    - parameter blendState: A D3D12_BLEND_DESC structure that describes the blend state.
    - parameter sampleMask: The sample mask for the blend state.
    - parameter rasterizerState: A D3D12_RASTERIZER_DESC structure that describes the rasterizer state.
    - parameter depthStencilState: A D3D12_DEPTH_STENCIL_DESC structure that describes the depth-stencil state.
    - parameter inputLayout: A D3D12_INPUT_LAYOUT_DESC structure that describes the input-buffer data for the input-assembler stage.
    - parameter indexBufferStripCutValue: Specifies the properties of the index buffer in a D3D12_INDEX_BUFFER_STRIP_CUT_VALUE structure.
    - parameter primitiveTopologyType: A D3D12_PRIMITIVE_TOPOLOGY_TYPE-typed value for the type of primitive, and ordering of the primitive data.
    - parameter renderTargetFormats: An array of DXGI_FORMAT-typed values for the render target formats.
    - parameter depthStencilFormat: A DXGI_FORMAT-typed value for the depth-stencil format.
    - parameter sampleDescription: A DXGI_SAMPLE_DESC structure that specifies multisampling parameters.
    - parameter multipleAdapterNodeMask: For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the device's physical adapters) for which the graphics pipeline state is to apply. Each bit in the mask corresponds to a single node. Refer to Multi-adapter systems.
    - parameter cachedPipelineState: A cached pipeline state object, as a D3D12_CACHED_PIPELINE_STATE structure. pCachedBlob and CachedBlobSizeInBytes may be set to NULL and 0 respectively.
    - parameter flags: A D3D12_PIPELINE_STATE_FLAGS enumeration constant such as for "tool debug".
    */
    public init(rootSignature: D3DRootSignature,
                vertexShader: D3DShaderBytecode,
                pixelShader: D3DShaderBytecode,
                domainShader: D3DShaderBytecode,
                hullShader: D3DShaderBytecode,
                geometryShader: D3DShaderBytecode,
                streamOutput: D3DStreamOutputDescriptor,
                blendState: D3DBlendDescription,
                sampleMask: UInt32,
                rasterizerState: D3DRasterizerDescription,
                depthStencilState: D3DDepthStencilDescription,
                inputLayout: D3DInputLayoutDesription,
                indexBufferStripCutValue: D3DIndexBufferStripCutValue,
                primitiveTopologyType: D3DPrimitiveTopologyType,
                renderTargetFormats: [DGIFormat],
                depthStencilFormat: DGIFormat,
                sampleDescription: DGISampleDescription,
                multipleAdapterNodeMask: UInt32,
                cachedPipelineState: D3DCachedPipelineState,
                flags: D3DPipelineStateFlags) {
        self.rawValue = RawValue()
        self.rootSignature = rootSignature
        self.vertexShader = vertexShader
        self.pixelShader = pixelShader
        self.domainShader = domainShader
        self.hullShader = hullShader
        self.geometryShader = geometryShader
        self.streamOutput = streamOutput
        self.blendState = blendState
        self.sampleMask = sampleMask
        self.rasterizerState = rasterizerState
        self.depthStencilState = depthStencilState
        self.inputLayout = inputLayout
        self.indexBufferStripCutValue = indexBufferStripCutValue
        self.primitiveTopologyType = primitiveTopologyType
        self.renderTargetFormats = renderTargetFormats
        self.depthStencilFormat = depthStencilFormat
        self.sampleDescription = sampleDescription
        self.multipleAdapterNodeMask = multipleAdapterNodeMask
        self.cachedPipelineState = cachedPipelineState
        self.flags = flags
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DGraphicsPipelineStateDescription")
public typealias D3D12_GRAPHICS_PIPELINE_STATE_DESC = D3DGraphicsPipelineStateDescription

#endif
