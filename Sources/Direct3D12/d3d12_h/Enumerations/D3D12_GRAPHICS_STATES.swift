/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines flags that specify states related to a graphics command list. Values can be bitwise OR'd together.
public struct GraphicsStates: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Specifies no state.
    //static let none = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_NONE.rawValue)

    ///	Specifies the state of the vertex buffer bindings on the input assembler stage.
    static let iaVertexBuffers = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_IA_VERTEX_BUFFERS.rawValue)
    ///	Specifies the state of the index buffer binding on the input assembler stage.
    static let iaIndexBuffers = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_IA_INDEX_BUFFER.rawValue)
    ///	Specifies the state of the primitive topology value set on the input assembler stage.
    static let iaPrimitiveTopology = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_IA_PRIMITIVE_TOPOLOGY.rawValue)
    ///	Specifies the state of the currently bound descriptor heaps.
    static let descriptorHeap = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_DESCRIPTOR_HEAP.rawValue)
    ///	Specifies the state of the currently set graphics root signature.
    static let graphicsRootSignature = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_GRAPHICS_ROOT_SIGNATURE.rawValue)
    ///	Specifies the state of the currently set compute root signature.
    static let computeRootSignature = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_COMPUTE_ROOT_SIGNATURE.rawValue)
    ///	Specifies the state of the viewports bound to the rasterizer stage.
    static let rsViewports = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_RS_VIEWPORTS.rawValue)
    ///	Specifies the state of the scissor rectangles bound to the rasterizer stage.
    static let rsScissorRects = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_RS_SCISSOR_RECTS.rawValue)
    ///	Specifies the predicate state.
    static let predication = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_PREDICATION.rawValue)
    ///	Specifies the state of the render targets bound to the output merger stage.
    static let omRenderTargets = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_OM_RENDER_TARGETS.rawValue)
    ///	Specifies the state of the reference value for depth stencil tests set on the output merger stage.
    static let omStencilReference = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_OM_STENCIL_REF.rawValue)
    ///	Specifies the state of the blend factor set on the output merger stage.
    static let omBelndFactor = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_OM_BLEND_FACTOR.rawValue)
    ///	Specifies the state of the pipeline state object.
    static let pipelineState = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_PIPELINE_STATE.rawValue)
    ///	Specifies the state of the buffer views bound to the stream output stage.
    static let soTargets = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_SO_TARGETS.rawValue)
    ///	Specifies the state of the depth bounds set on the output merger stage.
    static let omDepthBounds = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_OM_DEPTH_BOUNDS.rawValue)
    ///	Specifies the state of the sample positions.
    static let samplePositions = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_SAMPLE_POSITIONS.rawValue)
    ///	Specifies the state of the view instances mask.
    static let viewInstanceMask = GraphicsStates(rawValue: _d3d12.D3D12_GRAPHICS_STATE_VIEW_INSTANCE_MASK.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GraphicsStates")
public typealias D3D12_GRAPHICS_STATES = GraphicsStates

public extension GraphicsStates {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_GRAPHICS_STATE_NONE: GraphicsStates = []

    @available(*, deprecated, renamed: "iaVertexBuffers")
    static let D3D12_GRAPHICS_STATE_IA_VERTEX_BUFFERS = Self.iaVertexBuffers

    @available(*, deprecated, renamed: "iaIndexBuffers")
    static let D3D12_GRAPHICS_STATE_IA_INDEX_BUFFER = Self.iaIndexBuffers

    @available(*, deprecated, renamed: "iaPrimitiveTopology")
    static let D3D12_GRAPHICS_STATE_IA_PRIMITIVE_TOPOLOGY = Self.iaPrimitiveTopology

    @available(*, deprecated, renamed: "descriptorHeap")
    static let D3D12_GRAPHICS_STATE_DESCRIPTOR_HEAP = Self.descriptorHeap

    @available(*, deprecated, renamed: "graphicsRootSignature")
    static let D3D12_GRAPHICS_STATE_GRAPHICS_ROOT_SIGNATURE = Self.graphicsRootSignature

    @available(*, deprecated, renamed: "computeRootSignature")
    static let D3D12_GRAPHICS_STATE_COMPUTE_ROOT_SIGNATURE = Self.computeRootSignature

    @available(*, deprecated, renamed: "rsViewports")
    static let D3D12_GRAPHICS_STATE_RS_VIEWPORTS = Self.rsViewports

    @available(*, deprecated, renamed: "rsScissorRects")
    static let D3D12_GRAPHICS_STATE_RS_SCISSOR_RECTS = Self.rsScissorRects

    @available(*, deprecated, renamed: "predication")
    static let D3D12_GRAPHICS_STATE_PREDICATION = Self.predication

    @available(*, deprecated, renamed: "omRenderTargets")
    static let D3D12_GRAPHICS_STATE_OM_RENDER_TARGETS = Self.omRenderTargets

    @available(*, deprecated, renamed: "omStencilReference")
    static let D3D12_GRAPHICS_STATE_OM_STENCIL_REF = Self.omStencilReference

    @available(*, deprecated, renamed: "omBelndFactor")
    static let D3D12_GRAPHICS_STATE_OM_BLEND_FACTOR = Self.omBelndFactor

    @available(*, deprecated, renamed: "pipelineState")
    static let D3D12_GRAPHICS_STATE_PIPELINE_STATE = Self.pipelineState

    @available(*, deprecated, renamed: "soTargets")
    static let D3D12_GRAPHICS_STATE_SO_TARGETS = Self.soTargets

    @available(*, deprecated, renamed: "omDepthBounds")
    static let D3D12_GRAPHICS_STATE_OM_DEPTH_BOUNDS = Self.omDepthBounds

    @available(*, deprecated, renamed: "samplePositions")
    static let D3D12_GRAPHICS_STATE_SAMPLE_POSITIONS = Self.samplePositions

    @available(*, deprecated, renamed: "viewInstanceMask")
    static let D3D12_GRAPHICS_STATE_VIEW_INSTANCE_MASK = Self.viewInstanceMask
}

#endif
