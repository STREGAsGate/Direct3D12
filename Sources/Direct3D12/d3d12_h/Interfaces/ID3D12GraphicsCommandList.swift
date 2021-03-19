/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

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
    public func copyTextureRegion(_ region: Box, from source: TextureCopyLocation, to destination: TextureCopyLocation, atX x: UInt32, y: UInt32, z: UInt32 = 0) {
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


    @available(*, unavailable, message: "Not intended to be called directly. Use the PIX event runtime to insert events into a command queue.")
    func EndEvent(_ Metadata: Any, _ pData: Any, _ Size: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
