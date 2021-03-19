/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import WinSDK.DirectX

public class GraphicsCommandList: CommandList {

    /** Starts a query running.
    - parameter type: Specifies one member of D3D12_QUERY_TYPE.
    - parameter heap: Specifies the ID3D12QueryHeap containing the query.
    - parameter index: Specifies the index of the query within the query heap.
    */
    public func beginQuery(_ type: QueryType, on heap: QueryHeap, atIndex index: UInt32 = 0) {
        performFatally(as: RawValue.self) {pThis in
            let pQueryHeap = heap.performFatally(as: QueryHeap.RawValue.self) {$0}
            let Type = type.rawValue
            let Index = index
            pThis.pointee.lpVtbl.pointee.BeginQuery(pThis, pQueryHeap, Type, Index)
        }
    }

    /** Clears the depth-stencil resource.
    - parameter view: Describes the CPU descriptor handle that represents the start of the heap for the depth stencil to be cleared.
    - parameter flags: A combination of D3D12_CLEAR_FLAGS values that are combined by using a bitwise OR operation. The resulting value identifies the type of data to clear (depth buffer, stencil buffer, or both).
    - parameter depthValue: A value to clear the depth buffer with. This value will be clamped between 0 and 1.
    - parameter stencilValue: A value to clear the stencil buffer with.
    - parameter regions: An array of D3D12_RECT structures for the rectangles in the resource view to clear. If NULL, ClearDepthStencilView clears the entire resource view.
    */
    public func clearDepthStencilView(_ view: CPUDescriptorHandle,
                                      flags: ClearFlags,
                                      depthValue: Float32 = 0,
                                      stencilValue: UInt8 = 0,
                                      regions: [Rect]? = nil) {
        performFatally(as: RawValue.self) {pThis in
            let DepthStencilView = view.rawValue
            let ClearFlags = ClearFlags.RawType(flags.rawValue)
            let Depth = depthValue
            let Stencil = stencilValue
            let NumRects = UInt32(regions?.count ?? 0)
            let pRects = regions?.map({$0.rawValue})
            pThis.pointee.lpVtbl.pointee.ClearDepthStencilView(pThis, DepthStencilView, ClearFlags, Depth, Stencil, NumRects, pRects)
        }
    }

    /** Sets all the elements in a render target to one value.
    - parameter view: Specifies a D3D12_CPU_DESCRIPTOR_HANDLE structure that describes the CPU descriptor handle that represents the start of the heap for the render target to be cleared.
    - parameter clearColor: A 4-component array that represents the color to fill the render target with.
    - parameter regions: An array of D3D12_RECT structures for the rectangles in the resource view to clear. If NULL, ClearRenderTargetView clears the entire resource view.
    */
    public func clearRenderTargetView(_ view: CPUDescriptorHandle,
                                      withColor clearColor: [Float32],
                                      regions: [Rect]? = nil) {
        performFatally(as: RawValue.self) {pThis in
            let RenderTargetView = view.rawValue
            let ColorRGBA = clearColor
            let NumRects = UInt32(regions?.count ?? 0)
            let pRects = regions?.map({$0.rawValue})
            pThis.pointee.lpVtbl.pointee.ClearRenderTargetView(pThis, RenderTargetView, ColorRGBA, NumRects, pRects)
        }
    }

    /** Resets the state of a direct command list back to the state it was in when the command list was created.
    - parameters state: A pointer to the ID3D12PipelineState object that contains the initial pipeline state for the command list.
    It is invalid to call ClearState on a bundle. If an app calls ClearState on a bundle, the call to Close will return E_FAIL.

    When ClearState is called, all currently bound resources are unbound. The primitive topology is set to D3D_PRIMITIVE_TOPOLOGY_UNDEFINED. Viewports, scissor rectangles, stencil reference value, and the blend factor are set to empty values (all zeros). Predication is disabled.

    The app-provided pipeline state object becomes bound as the currently set pipeline state object.
    */
    public func clearState(usingInitialPipleineState state: PipelineState) {
        performFatally(as: RawValue.self) {pThis in
            let pPipelineState = state.performFatally(as: PipelineState.RawValue.self) {$0}
            pThis.pointee.lpVtbl.pointee.ClearState(pThis, pPipelineState)
        }
    }

    /** Sets all of the elements in an unordered-access view (UAV) to the specified float values.
    - parameter gpuHandle: A D3D12_GPU_DESCRIPTOR_HANDLE that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must be in a shader-visible descriptor heap, which must be set on the command list via SetDescriptorHeaps.
    - parameter cpuHandle: A D3D12_CPU_DESCRIPTOR_HANDLE in a non-shader visible descriptor heap that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must not be in a shader-visible descriptor heap. This is to allow drivers thath implement the clear as fixed-function hardware (rather than via a dispatch) to efficiently read from the descriptor, as shader-visible heaps may be created in WRITE_BACK memory (similar to D3D12_HEAP_TYPE_UPLOAD heap types), and CPU reads from this type of memory are prohibitively slow.
    - parameter resource: A pointer to the ID3D12Resource interface that represents the unordered-access-view (UAV) resource to clear.
    - parameter values: A 4-component array that containing the values to fill the unordered-access-view resource with.
    - prameter regions: An array of D3D12_RECT structures for the rectangles in the resource view to clear. If NULL, ClearUnorderedAccessViewFloat clears the entire resource view.
    */
    public func clearUnorderedAccessView(gpuHandle: GPUDescriptorHandle,
                                         cpuHandle: CPUDescriptorHandle,
                                         resource: Resource,
                                         floatValues values: [Float32],
                                         regions: [Rect]? = nil) {
        performFatally(as: RawValue.self) {pThis in
            let ViewGPUHandleInCurrentHeap = gpuHandle.rawValue
            let ViewCPUHandle = cpuHandle.rawValue
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            let Values = values
            let NumRects = UInt32(regions?.count ?? 0)
            let pRects = regions?.map({$0.rawValue})
            pThis.pointee.lpVtbl.pointee.ClearUnorderedAccessViewFloat(pThis, ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects)
        }
    }

    /** Sets all of the elements in an unordered-access view (UAV) to the specified float values.
    - parameter gpuHandle: A D3D12_GPU_DESCRIPTOR_HANDLE that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must be in a shader-visible descriptor heap, which must be set on the command list via SetDescriptorHeaps.
    - parameter cpuHandle: A D3D12_CPU_DESCRIPTOR_HANDLE in a non-shader visible descriptor heap that references an initialized descriptor for the unordered-access view (UAV) that is to be cleared. This descriptor must not be in a shader-visible descriptor heap. This is to allow drivers thath implement the clear as fixed-function hardware (rather than via a dispatch) to efficiently read from the descriptor, as shader-visible heaps may be created in WRITE_BACK memory (similar to D3D12_HEAP_TYPE_UPLOAD heap types), and CPU reads from this type of memory are prohibitively slow.
    - parameter resource: A pointer to the ID3D12Resource interface that represents the unordered-access-view (UAV) resource to clear.
    - parameter values: A 4-component array that containing the values to fill the unordered-access-view resource with.
    - prameter regions: An array of D3D12_RECT structures for the rectangles in the resource view to clear. If NULL, ClearUnorderedAccessViewFloat clears the entire resource view.
    */
    public func clearUnorderedAccessView(gpuHandle: GPUDescriptorHandle,
                                         cpuHandle: CPUDescriptorHandle,
                                         resource: Resource,
                                         uintValues values: [UInt32],
                                         regions: [Rect]? = nil) {
        performFatally(as: RawValue.self) {pThis in
            let ViewGPUHandleInCurrentHeap = gpuHandle.rawValue
            let ViewCPUHandle = cpuHandle.rawValue
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            let Values = values
            let NumRects = UInt32(regions?.count ?? 0)
            let pRects = regions?.map({$0.rawValue})
            pThis.pointee.lpVtbl.pointee.ClearUnorderedAccessViewUint(pThis, ViewGPUHandleInCurrentHeap, ViewCPUHandle, pResource, Values, NumRects, pRects)
        }
    }

    /** Indicates that recording to the command list has finished.
    The runtime will validate that the command list has not previously been closed. If an error was encountered during recording, the error code is returned here. The runtime won't call the close device driver interface (DDI) in this case.
    */
    public func close() throws {
        try perform(as: RawValue.self) {pThis in
            try pThis.pointee.lpVtbl.pointee.Close(pThis).checkResult()
        }
    }

    /** Copies a region of a buffer from one resource to another.
    - parameter source: Specifies the source ID3D12Resource.
    - parameter srcOffset: Specifies a UINT64 offset (in bytes) into the source resource, to start the copy from.
    - parameter destination: Specifies the destination ID3D12Resource.
    - parameter dstOffset: Specifies a UINT64 offset (in bytes) into the destination resource.
    - parameter count: Specifies the number of bytes to copy.
    */
    public func copyBufferRegion(from source: Resource, at srcOffset: UInt64, to destination: Resource, at dstOffset: UInt64, count: UInt64) {
        performFatally(as: RawValue.self) {pThis in
            let pDstBuffer = destination.performFatally(as: Resource.RawValue.self) {$0}
            let DstOffset = dstOffset
            let pSrcBuffer = source.performFatally(as: Resource.RawValue.self) {$0}
            let SrcOffset = srcOffset
            let NumBytes = count
            pThis.pointee.lpVtbl.pointee.CopyBufferRegion(pThis, pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, NumBytes)
        }
    }

    /** Copies the entire contents of the source resource to the destination resource.
    - parameter source: A pointer to the ID3D12Resourceinterface that represents the source resource.
    - parameter destination: A pointer to the ID3D12Resourceinterface that represents the destination resource.
    */
    public func copyResource(from source: Resource, to destination: Resource) {
        performFatally(as: RawValue.self) {pThis in
            let pDstBuffer = destination.performFatally(as: Resource.RawValue.self) {$0}
            let pSrcBuffer = source.performFatally(as: Resource.RawValue.self) {$0}
            pThis.pointee.lpVtbl.pointee.CopyResource(pThis, pDstBuffer, pSrcBuffer)
        }
    }

    /** This method uses the GPU to copy texture data between two locations. Both the source and the destination may reference texture data located within either a buffer resource or a texture resource.
    - parameter region: Specifies an optional D3D12_BOX that sets the size of the source texture to copy.
    - parameter source: Specifies the source D3D12_TEXTURE_COPY_LOCATION. The subresource referred to must be in the D3D12_RESOURCE_STATE_COPY_SOURCE state.
    - parameter destination: Specifies the destination D3D12_TEXTURE_COPY_LOCATION. The subresource referred to must be in the D3D12_RESOURCE_STATE_COPY_DEST state.
    - parameter x: The x-coordinate of the upper left corner of the destination region.
    - parameter y: The y-coordinate of the upper left corner of the destination region. For a 1D subresource, this must be zero.
    - parameter z: The z-coordinate of the upper left corner of the destination region. For a 1D or 2D subresource, this must be zero.
    The source box must be within the size of the source resource. The destination offsets, (x, y, and z), allow the source box to be offset when writing into the destination resource; however, the dimensions of the source box and the offsets must be within the size of the resource. If you try and copy outside the destination resource or specify a source box that is larger than the source resource, the behavior of CopyTextureRegion is undefined. If you created a device that supports the debug layer, the debug output reports an error on this invalid CopyTextureRegion call. Invalid parameters to CopyTextureRegion cause undefined behavior and might result in incorrect rendering, clipping, no copy, or even the removal of the rendering device.

    If the resources are buffers, all coordinates are in bytes; if the resources are textures, all coordinates are in texels.

    CopyTextureRegion performs the copy on the GPU (similar to a memcpy by the CPU). As a consequence, the source and destination resources:

    * Must be different subresources (although they can be from the same resource).
    * Must have compatible DXGI_FORMATs (identical or from the same type group). For example, a DXGI_FORMAT_R32G32B32_FLOAT texture can be copied to an DXGI_FORMAT_R32G32B32_UINT texture since both of these formats are in the DXGI_FORMAT_R32G32B32_TYPELESS group. CopyTextureRegion can copy between a few format types. For more info, see Format Conversion using Direct3D 10.1.
    CopyTextureRegion only supports copy; it does not support any stretch, color key, or blend. CopyTextureRegion can reinterpret the resource data between a few format types.
    Note that for a depth-stencil buffer, the depth and stencil planes are separate subresources within the buffer.

    To copy an entire resource, rather than just a region of a subresource, we recommend to use CopyResource instead.
    */
    public func copyTextureRegion(_ region: Box, 
                                 from source: TextureCopyLocation, 
                                 to destination: TextureCopyLocation, 
                                 atX x: UInt32, y: UInt32, z: UInt32 = 0) {
        performFatally(as: RawValue.self) {pThis in
            var pDst = destination.rawValue
            let DstX = x
            let DstY = y
            let DstZ = z
            var pSrc = source.rawValue
            var pSrcBox = region.rawValue
            pThis.pointee.lpVtbl.pointee.CopyTextureRegion(pThis, &pDst, DstX, DstY, DstZ, &pSrc, &pSrcBox)
        }
    }

    /** Copies tiles from buffer to tiled resource or vice versa.
    - parameter tiledResource: A pointer to a tiled resource.
    - parameter start: A pointer to a D3D12_TILED_RESOURCE_COORDINATE structure that describes the starting coordinates of the tiled resource.
    - parameter size: A pointer to a D3D12_TILE_REGION_SIZE structure that describes the size of the tiled region.
    - parameter buffer: A pointer to an ID3D12Resource that represents a default, dynamic, or staging buffer.
    - parameter offset: The offset in bytes into the buffer at pBuffer to start the operation.
    - perameter flags: A combination of D3D12_TILE_COPY_FLAGS-typed values that are combined by using a bitwise OR operation and that identifies how to copy tiles.
    */
    public func copyTiles(from tiledResource: Resource, at start: TiledResourceCoordinate, size: TileRegionSize,
                          buffer: Resource, offset: UInt64,
                          flags: TileCopyFlags) {
        performFatally(as: RawValue.self) {pThis in
            let pTiledResource = tiledResource.performFatally(as: Resource.RawValue.self) {$0}
            var pTileRegionStartCoordinate = start.rawValue
            var pTileRegionSize = size.rawValue
            let pBuffer = buffer.performFatally(as: Resource.RawValue.self) {$0}
            let BufferStartOffsetInBytes = offset
            let Flags = TileCopyFlags.RawType(flags.rawValue)
            pThis.pointee.lpVtbl.pointee.CopyTiles(pThis, pTiledResource, &pTileRegionStartCoordinate, &pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags)
        }
    }

    /** Indicates that the contents of a resource don't need to be preserved. The function may re-initialize resource metadata in some cases.
    - parameter resource: A pointer to the ID3D12Resource interface for the resource to discard.
    - parameter region: A pointer to a D3D12_DISCARD_REGION structure that describes details for the discard-resource operation.
    */
    public func discardResource(_ resource: Resource, region: DiscardRegion? = nil) {
        performFatally(as: RawValue.self) {pThis in
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            if var pRegion = region?.rawValue {
                pThis.pointee.lpVtbl.pointee.DiscardResource(pThis, pResource, &pRegion)
            }else{
                pThis.pointee.lpVtbl.pointee.DiscardResource(pThis, pResource, nil)
            }
        }
    }

    /** Executes a command list from a thread group.
    - parameter countX: The number of groups dispatched in the x direction. ThreadGroupCountX must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
    - parameter countY: The number of groups dispatched in the y direction. ThreadGroupCountY must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535).
    - parameter countZ: The number of groups dispatched in the z direction. ThreadGroupCountZ must be less than or equal to D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION (65535). In feature level 10 the value for ThreadGroupCountZ must be 1.
    */
    public func dispatch(countX: UInt32, countY: UInt32 = 1, countZ: UInt32 = 1) {
        performFatally(as: RawValue.self) {pThis in
            pThis.pointee.lpVtbl.pointee.Dispatch(pThis, countX, countY, countZ)
        }
    }

    /** Draws indexed, instanced primitives.
    - parameter instanceCount: Number of instances to draw.
    - parameter instanceStartIndex: A value added to each index before reading per-instance data from a vertex buffer.
    - parameter indexCount: Number of indices read from the index buffer for each instance.
    - parameter startIndex: The location of the first index read by the GPU from the index buffer.
    - parameter baseVertexLocation: A value added to each index before reading a vertex from the vertex buffer.
    */
    public func drawIndexedInstanced(indexCountPerInstance: UInt32,
                                     instanceCount: UInt32,
                                     startIndexLocation: UInt32,
                                     baseVertexLocation: Int32,
                                     startInstanceLocation: UInt32) {
        performFatally(as: RawValue.self) {pThis in
            let IndexCountPerInstance = indexCountPerInstance
            let InstanceCount = instanceCount
            let StartIndexLocation = startIndexLocation
            let BaseVertexLocation = baseVertexLocation
            let StartInstanceLocation = startInstanceLocation
            pThis.pointee.lpVtbl.pointee.DrawIndexedInstanced(pThis, IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation)
        }
    }

    /** Draws non-indexed, instanced primitives.
    - parameter vertexCountPerInstance: Number of vertices to draw.
    - parameter instanceCount: Number of instances to draw.
    - parameter startVertexLocation: Index of the first vertex.
    - parameter startInstanceLocation: A value added to each index before reading per-instance data from a vertex buffer.
    */
    public func drawInstanced(vertexCountPerInstance: UInt32, 
                              instanceCount: UInt32, 
                              startVertexLocation: UInt32, 
                              startInstanceLocation: UInt32) {
        performFatally(as: RawValue.self) {pThis in
            let VertexCountPerInstance = vertexCountPerInstance
            let InstanceCount = instanceCount
            let StartVertexLocation = startVertexLocation
            let StartInstanceLocation = startInstanceLocation
            pThis.pointee.lpVtbl.pointee.DrawInstanced(pThis, VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation)
        }
    }

    /** Ends a running query.
    - parameter queryHeap: Specifies the ID3D12QueryHeap containing the query.
    - parameter type: Specifies one member of D3D12_QUERY_TYPE.
    - parameter index: Specifies the index of the query in the query heap.
    */
    public func endQuery(_ queryHeap: QueryHeap, type: QueryType, index: UInt32 = 0) {
        performFatally(as: RawValue.self) {pThis in
            let pQueryHeap = queryHeap.performFatally(as: QueryHeap.RawValue.self) {$0}
            let Type = type.rawValue
            let Index = index
            pThis.pointee.lpVtbl.pointee.EndQuery(pThis, pQueryHeap, Type, Index)
        }
    }
    
    /** Executes a bundle.
    - parameter bundle: Specifies the ID3D12GraphicsCommandList that determines the bundle to be executed.
    */
    public func executeBundle(_ bundle: GraphicsCommandList) {
        performFatally(as: RawValue.self) {pThis in
            let pCommandList = bundle.performFatally(as: GraphicsCommandList.RawValue.self) {$0}
            pThis.pointee.lpVtbl.pointee.ExecuteBundle(pThis, pCommandList)
        }
    }

    /** Apps perform indirect draws/dispatches using the ExecuteIndirect method.
    - parameter signature: Specifies a ID3D12CommandSignature. The data referenced by pArgumentBuffer will be interpreted depending on the contents of the command signature. Refer to Indirect Drawing for the APIs that are used to create a command signature.
    - parameter maxCount: There are two ways that command counts can be specified: If pCountBuffer is not NULL, then MaxCommandCount specifies the maximum number of operations which will be performed. The actual number of operations to be performed are defined by the minimum of this value, and a 32-bit unsigned integer contained in pCountBuffer (at the byte offset specified by CountBufferOffset). If pCountBuffer is NULL, the MaxCommandCount specifies the exact number of operations which will be performed.
    - parameter argumentBuffer: Specifies one or more ID3D12Resource objects, containing the command arguments.
    - parameter argumentBufferOffset: Specifies an offset into pArgumentBuffer to identify the first command argument.
    - parameter countBuffer: Specifies a pointer to a ID3D12Resource.
    - parameter countBufferOffset: Specifies a UINT64 that is the offset into pCountBuffer, identifying the argument count.
    */
    public func executeIndirect(signature: CommandSignature,
                                maxCount: UInt32,
                                argumentBuffer: Resource,
                                argumentBufferOffset: UInt64,
                                countBuffer: Resource,
                                countBufferOffset: UInt64) {
        performFatally(as: RawValue.self) {pThis in
            let pCommandSignature = signature.performFatally(as: CommandSignature.RawValue.self) {$0}
            let MaxCommandCount = maxCount
            let pArgumentBuffer = argumentBuffer.performFatally(as: Resource.RawValue.self) {$0}
            let ArgumentBufferOffset = argumentBufferOffset
            let pCountBuffer = countBuffer.performFatally(as: Resource.RawValue.self) {$0}
            let CountBufferOffset = countBufferOffset
            pThis.pointee.lpVtbl.pointee.ExecuteIndirect(pThis, pCommandSignature, MaxCommandCount, pArgumentBuffer, ArgumentBufferOffset, pCountBuffer, CountBufferOffset)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension GraphicsCommandList {
    typealias RawValue = WinSDK.ID3D12GraphicsCommandList
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension GraphicsCommandList.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12GraphicsCommandList}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GraphicsCommandList")
public typealias ID3D12GraphicsCommandList = GraphicsCommandList

public extension GraphicsCommandList {
    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func BeginEvent(_ Metadata: Any, _ pData: Any, _ Size: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "beginQuery(_:on:atIndex:)")
    func BeginQuery(_ pQueryHeap: Any, _ Type: Any, _ Index: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clearDepthStencilView")
    func ClearDepthStencilView(_ DepthStencilView: Any, 
                               _ ClearFlags: Any, 
                               _ Depth: Any,
                               _ Stencil: Any,
                               _ NumRects: Any,
                               _ pRects: Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clearRenderTargetView")
    func ClearRenderTargetView(_ RenderTargetView: Any, 
                               _ ColorRGBA: Any, 
                               _ NumRects: Any,
                               _ pRects: Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clearState(usingInitialPipleineState:)")
    func ClearState(_ pPipelineState: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clearUnorderedAccessView(gpuHandle:cpuHandle:resource:floatValues:regions:)")
    func ClearUnorderedAccessViewFloat(_ ViewGPUHandleInCurrentHeap: Any, 
                                       _ ViewCPUHandle: Any, 
                                       _ pResource: Any,
                                       _ Values: Any,
                                       _ NumRects: Any,
                                       _ pRects: Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "clearUnorderedAccessView(gpuHandle:cpuHandle:resource:uintValues:regions:)")
    func ClearUnorderedAccessViewUint(_ ViewGPUHandleInCurrentHeap: Any, 
                                      _ ViewCPUHandle: Any, 
                                      _ pResource: Any,
                                      _ Values: Any,
                                      _ NumRects: Any,
                                      _ pRects: Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "close()")
    func Close() -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyBufferRegion(from:at:to:at:count:)")
    func CopyBufferRegion(_ pDstBuffer: Any, 
                          _ DstOffset: Any, 
                          _ pSrcBuffer: Any,
                          _ SrcOffset: Any,
                          _ NumBytes: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyResource(from:to:)")
    func CopyResource(_ pDstResource: Any,
                      _ pSrcResource: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyTextureRegion(_:from:to:atX:y:z:)")
    func CopyTextureRegion(_ pDst: Any,
                           _ DstX: Any,
                           _ DstY: Any,
                           _ DstZ: Any,
                           _ pSrc: Any,
                           _ pSrcBox: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyTiles(from:at:size:buffer:offset:flags:)")
    func CopyTiles(_ pTiledResource: Any,
                   _ pTileRegionStartCoordinate: Any,
                   _ pTileRegionSize: Any,
                   _ pBuffer: Any,
                   _ BufferStartOffsetInBytes: Any,
                   _ Flags: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "discardResource(_:region:)")
    func DiscardResource(_ pResource: Any,
                         _ pRegion: Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "dispatch(countX:countY:countZ:)")
    func Dispatch(_ ThreadGroupCountX: Any,
                  _ ThreadGroupCountY: Any,
                  _ ThreadGroupCountZ: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "drawIndexedInstanced(indexCountPerInstance:instanceCount:startIndexLocation:baseVertexLocation:startInstanceLocation:)")
    func DrawIndexedInstanced(_ IndexCountPerInstance: Any,
                              _ InstanceCount: Any,
                              _ StartIndexLocation: Any,
                              _ BaseVertexLocation: Any,
                              _ StartInstanceLocation: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "drawInstanced(vertexCountPerInstance:instanceCount:startVertexLocation:startInstanceLocation:)")
    func DrawInstanced(_ VertexCountPerInstance: Any,
                       _ InstanceCount: Any,
                       _ StartVertexLocation: Any,
                       _ StartInstanceLocation: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func EndEvent(_ Metadata: Any, _ pData: Any, _ Size: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "endQuery(_:type:index:)")
    func EndQuery(_ pQueryHeap: Any, _ Type: Any, _ Index: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "executeBundle(_:)")
    func ExecuteBundle(_ pCommandList: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "executeIndirect(signature:maxCount:argumentBuffer:offset:countBuffer:offset:)")
    func ExecuteIndirect(_ pCommandSignature: Any,
                         _ MaxCommandCount: Any,
                         _ pArgumentBuffer: Any,
                         _ ArgumentBufferOffset: Any,
                         _ pCountBuffer: Any?,
                         _ CountBufferOffset: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
