/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.19041)
public extension Device {
    /** Creates both a resource and an implicit heap (optionally for a protected session), such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC1 structure that describes the resource, including a mip region.
    - parameter properties: A pointer to a D3D12_HEAP_PROPERTIES structure that provides properties for the resource's heap.
    - parameter flags: Heap options, as a bitwise-OR'd combination of D3D12_HEAP_FLAGS enumeration constants.
    - parameter state: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE structure that describes the default value for a clear color.
    - parameter session: An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an ID3D12ProtectedResourceSession by calling ID3D12Device4::CreateProtectedResourceSession.
    */
    func createCommittedResource(description: ResourceDescription1,
                                 properties: HeapProperties,
                                 flags: HeapFlags = [],
                                 state: ResourceStates,
                                 clearColor: ClearValue,
                                 session: ProtectedResourceSession?) throws -> Resource {
        return try perform(as: RawValue8.self) {pThis in
            var pHeapProperties = properties.rawValue
            let HeapFlags = HeapFlags.RawType(flags.rawValue)
            var pDesc = description.rawValue
            let InitialResourceState = ResourceStates.RawType(state.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            let pProtectedSession = try session?.perform(as: ProtectedResourceSession.RawValue.self) {$0}
            var riidResource = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommittedResource2(pThis, &pHeapProperties, HeapFlags, &pDesc, InitialResourceState, &pOptimizedClearValue, pProtectedSession, &riidResource, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

        /** Creates a resource that is placed in a specific heap. Placed resources are the lightest weight resource objects available, and are the fastest to create and destroy.
    - parameter heap: A pointer to the ID3D12Heap interface that represents the heap in which the resource is placed.
    - parameter offset: The offset, in bytes, to the resource. The HeapOffset must be a multiple of the resource's alignment, and HeapOffset plus the resource size must be smaller than or equal to the heap size. GetResourceAllocationInfo must be used to understand the sizes of texture resources.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC1 structure that describes the resource.
    - parameter initialState: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants. When a resource is created together with a D3D12_HEAP_TYPE_UPLOAD heap, InitialState must be D3D12_RESOURCE_STATE_GENERIC_READ. When a resource is created together with a D3D12_HEAP_TYPE_READBACK heap, InitialState must be D3D12_RESOURCE_STATE_COPY_DEST.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE that describes the default value for a clear color.
    */
    func createPlacedResource(heap: Heap, 
                              offset: UInt64, 
                              description: ResourceDescription1,
                              initialState: ResourceStates,
                              clearColor: ClearValue) throws -> Resource {
        return try perform(as: RawValue8.self) {pThis in
            let pHeap = try heap.perform(as: Heap.RawValue.self) {$0}
            let HeapOffset = offset
            var pDesc = description.rawValue
            let InitialState = ResourceStates.RawType(initialState.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            var riid = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreatePlacedResource1(pThis, pHeap, HeapOffset, &pDesc, InitialState, &pOptimizedClearValue, &riid, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** For purposes of sampler feedback, creates a descriptor suitable for binding.
    - parameter target: The targeted resource, such as a texture, to create a descriptor for.
    - parameter feedback: The feedback resource, such as a texture, to create a descriptor for.
    - parameter destination: The CPU descriptor handle.
    */
    func createSamplerFeedbackUnorderedAccessView(target: Resource?, feedback: Resource?, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue8.self) {pThis in
            let pTargetedResource = target?.performFatally(as: Resource.RawValue.self) {$0}
            let pFeedbackResource = feedback?.performFatally(as: Resource.RawValue.self) {$0}
            let DestDescriptor = destination.rawValue
            pThis.pointee.lpVtbl.pointee.CreateSamplerFeedbackUnorderedAccessView(pThis, pTargetedResource, pFeedbackResource, DestDescriptor)
        }
    }

    /** Gets a resource layout that can be copied. Helps the app fill-in D3D12_PLACED_SUBRESOURCE_FOOTPRINT and D3D12_SUBRESOURCE_FOOTPRINT when suballocating space in upload heaps.
    - parameter description: A description of the resource, as a pointer to a D3D12_RESOURCE_DESC structure.
    - parameter firstIndex: Index of the first subresource in the resource. The range of valid values is 0 to D3D12_REQ_SUBRESOURCES.
    - parameter count: The number of subresources in the resource. The range of valid values is 0 to (D3D12_REQ_SUBRESOURCES - FirstSubresource).
    - parameter offset: The offset, in bytes, to the resource.
    - parameter layouts: A pointer to an array (of length NumSubresources) of D3D12_PLACED_SUBRESOURCE_FOOTPRINT structures, to be filled with the description and placement of each subresource.
    - returns rowCounts: A pointer to an array (of length NumSubresources) of integer variables, to be filled with the number of rows for each subresource.
    - returns rowSizes: A pointer to an array (of length NumSubresources) of integer variables, each entry to be filled with the unpadded size in bytes of a row, of each subresource. For example, if a Texture2D resource has a width of 32 and bytes per pixel of 4, then pRowSizeInBytes returns 128. pRowSizeInBytes should not be confused with row pitch, as examining pLayouts and getting the row pitch from that will give you 256 as it is aligned to D3D12_TEXTURE_DATA_PITCH_ALIGNMENT.
    - returns totalByteSize: A pointer to an integer variable, to be filled with the total size, in bytes.
    */
    func copyableFootprints(description: ResourceDescription1,
                            firstIndex: UInt32,
                            count: UInt32,
                            offset: UInt64,
                            layouts: PlacedSubresourceFootprint) -> (rowCounts: [UInt32], rowSizes: [UInt64], totalByteSize: UInt64) {
        performFatally(as: RawValue8.self) {pThis in 
            var pResourceDesc = description.rawValue
            let FirstSubresource = firstIndex
            let NumSubresources = count
            let BaseOffset = offset
            var pLayouts = layouts.rawValue

            var pNumRows: [UInt32] = Array(repeating: 0, count: Int(count))
            var pRowSizeInBytes: [UInt64] = Array(repeating: 0, count: Int(count))
            var pTotalBytes: UInt64 = 0
            pThis.pointee.lpVtbl.pointee.GetCopyableFootprints1(pThis, &pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, &pLayouts, &pNumRows, &pRowSizeInBytes, &pTotalBytes)
            return (pNumRows, pRowSizeInBytes, pTotalBytes)
        }
    }

    /** Gets rich info about the size and alignment of memory required for a collection of resources on this adapter. Also see ID3D12Device::GetResourceAllocationInfo. In addition to the D3D12_RESOURCE_ALLOCATION_INFO returned from the method, this version also returns an array of D3D12_RESOURCE_ALLOCATION_INFO1 structures, which provide additional details for each resource description passed as input. See the pResourceAllocationInfo1 parameter.
    - parameter multipleAdapterNodeMask: For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see Multi-adapter systems.
    - parameter descriptions: An array of D3D12_RESOURCE_DESC structures that described the resources to get info about.
    - returns info: A D3D12_RESOURCE_ALLOCATION_INFO structure that provides info about video memory allocated for the specified array of resources.
    - returns infos: An array of D3D12_RESOURCE_ALLOCATION_INFO1 structures, containing additional details for each resource description passed as input. This makes it simpler for your application to allocate a heap for multiple resources, and without manually computing offsets for where each resource should be placed.
    */
    func resourceAllocationInfo(multipleAdapterNodeMask: UInt32 = 0,
                                descriptions: [ResourceDescription1]) -> (info: ResourceAllocationInfo, infos: [ResourceAllocationInfo1]) {
        return performFatally(as: RawValue8.self) {pThis in
            let visibleMask = multipleAdapterNodeMask
            let numResourceDescs = UInt32(descriptions.count)
            var pResourceDescs = descriptions.map({$0.rawValue})
            let pResourceAllocationInfo1 = UnsafeMutableBufferPointer<ResourceAllocationInfo1.RawValue>(start: nil, count: descriptions.count)
            let i = pThis.pointee.lpVtbl.pointee.GetResourceAllocationInfo2(pThis, visibleMask, numResourceDescs, &pResourceDescs, pResourceAllocationInfo1.baseAddress)
            return (ResourceAllocationInfo(i), Array(pResourceAllocationInfo1).map({ResourceAllocationInfo1($0)}))
        }
    }
}

@available(Windows, introduced: 10.0.19041)
extension Device {
    typealias RawValue8 = WinSDK.ID3D12Device8
    convenience init(_ rawValue: inout RawValue8) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.19041)
extension Device.RawValue8 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device8}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device8 = Device

@available(Windows, introduced: 10.0.19041)
public extension Device {
    @available(*, unavailable, renamed: "createCommittedResource")
    func CreateCommittedResource2(_ pHeapProperties: Any,
                                  _ HeapFlags: Any,
                                  _ pDesc: Any,
                                  _ InitialResourceState: Any,
                                  _ pOptimizedClearValue: Any,
                                  _ pProtectedSession: Any,
                                  _ riidResource: Any,
                                  _ ppvResource: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createPlacedResource")
    func CreatePlacedResource1(_ pHeap: Any,
                               _ HeapOffset: Any,
                               _ pDesc: Any,
                               _ InitialState: Any,
                               _ pOptimizedClearValue: Any,
                               _ riid: Any,
                               _ ppvResource: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createSamplerFeedbackUnorderedAccessView")
    func CreateSamplerFeedbackUnorderedAccessView(_ pTargetedResource: Any,
                                                  _ pFeedbackResource: Any,
                                                  _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyableFootprints")
    func GetCopyableFootprints1(_ pResourceDesc: Any,
                                _ FirstSubresource: Any,
                                _ NumSubresources: Any,
                                _ BaseOffset: Any,
                                _ pLayouts: Any,
                                _ pNumRows: inout Any?,
                                _ pRowSizeInBytes: inout Any?,
                                _ pTotalBytes: inout Any?) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "resourceAllocationInfo")
    func GetResourceAllocationInfo2(_ visibleMask: Any, 
                                    _ numResourceDescs: Any,
                                    _ pResourceDescs: Any,
                                    _ pResourceAllocationInfo1: Any) -> ResourceAllocationInfo.RawValue {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
