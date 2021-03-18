/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class Device: Object {
    
    /** Gets information about the features that are supported by the current graphics driver.
    - parameter feature: A constant from the D3D12_FEATURE enumeration describing the feature(s) that you want to query for support.
    - parameter A pointer to a data structure that corresponds to the value of the Feature parameter. To determine the corresponding data structure for each constant, see D3D12_FEATURE.
    */
    public func supports<T>(_ feature: Feature, _ structure: T) -> Bool {
        return performFatally(as: RawValue.self) {pThis in
            let size = UInt32(MemoryLayout<T>.size)
            var s = structure
            return pThis.pointee.lpVtbl.pointee.CheckFeatureSupport(pThis, feature.rawValue, &s, size).isSuccess
        }
    }

    /** Copies descriptors from a source to a destination.
        Both the source and destination descriptor heaps must have the same type, else the debug layer will emit an error.
    - parameter destRangeStarts: An array of D3D12_CPU_DESCRIPTOR_HANDLE objects to copy to. All the destination and source descriptors must be in heaps of the same D3D12_DESCRIPTOR_HEAP_TYPE.
    - parameter destRangeSizes: An array of destination descriptor range sizes to copy to.
    - parameter srcRangeStarts: An array of D3D12_CPU_DESCRIPTOR_HANDLE objects to copy from. All elements in the pSrcDescriptorRangeStarts parameter must be in a non shader-visible descriptor heap.
    - parameter srcRangeSizes: An array of source descriptor range sizes to copy from.
    - parameter type: The D3D12_DESCRIPTOR_HEAP_TYPE-typed value that specifies the type of descriptor heap to copy with. This is required as different descriptor types may have different sizes.
    */
    public func copyDescriptors(destRangeStarts: [CPUDescriptorHandle],
                                destRangeSizes: [UInt32],
                                srcRangeStarts: [CPUDescriptorHandle],
                                srcRangeSizes: [UInt32],
                                type: DescriptorHeapType) {
        performFatally(as: RawValue.self) {pThis in
            let NumDestDescriptorRanges = UInt32(destRangeStarts.count)
            let pDestDescriptorRangeStarts = destRangeStarts.map({$0.rawValue})
            let pDestDescriptorRangeSizes = destRangeSizes
            let NumSrcDescriptorRanges = UInt32(srcRangeStarts.count)
            let pSrcDescriptorRangeStarts = srcRangeStarts.map({$0.rawValue})
            let pSrcDescriptorRangeSizes = srcRangeSizes
            let DescriptorHeapsType = type.rawValue
            pThis.pointee.lpVtbl.pointee.CopyDescriptors(pThis, 
                                                         NumDestDescriptorRanges, pDestDescriptorRangeStarts, pDestDescriptorRangeSizes,
                                                         NumSrcDescriptorRanges, pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizes,
                                                         DescriptorHeapsType)
        }
    }

    /** Copies descriptors from a source to a destination.
    - parameter destRangeStart: A D3D12_CPU_DESCRIPTOR_HANDLE that describes the destination descriptors to start to copy to.
    - parameter srcRangeStart: A D3D12_CPU_DESCRIPTOR_HANDLE that describes the source descriptors to start to copy from. All elements in the pSrcDescriptorRangeStarts parameter must be in a non shader-visible descriptor heap.
    - parameter count: The number of descriptors to copy.
    - parameter type: The D3D12_DESCRIPTOR_HEAP_TYPE-typed value that specifies the type of descriptor heap to copy with. This is required as different descriptor types may have different sizes.
    */
    public func copyDescriptors(from destRangeStart: CPUDescriptorHandle,
                                to srcRangeStart: CPUDescriptorHandle,
                                count: UInt32,
                                type: DescriptorHeapType) {
        performFatally(as: RawValue.self) {pThis in
            let NumDescriptors = count
            let pDestDescriptorRangeStarts = destRangeStart.rawValue
            let pSrcDescriptorRangeStarts = srcRangeStart.rawValue
            let DescriptorHeapsType = type.rawValue
            pThis.pointee.lpVtbl.pointee.CopyDescriptorsSimple(pThis, 
                                                               NumDescriptors, 
                                                               pDestDescriptorRangeStarts, pSrcDescriptorRangeStarts,
                                                               DescriptorHeapsType)
        }
    }

    /** Creates a command allocator object.
    - parameters type: A D3D12_COMMAND_LIST_TYPE-typed value that specifies the type of command allocator to create. The type of command allocator can be the type that records either direct command lists or bundles.
    */
    public func createCommandAllocator(type: CommandListType) throws -> CommandAllocator {
        return try perform(as: RawValue.self) {pThis in
            var ppCommandAllocator: UnsafeMutableRawPointer?
            var riid = CommandAllocator.interfaceID
            try pThis.pointee.lpVtbl.pointee.CreateCommandAllocator(pThis, type.rawValue, &riid, &ppCommandAllocator).checkResult()
            guard let p = ppCommandAllocator else {throw Error(.invalidArgument)}
            return CommandAllocator(win32Pointer: p)
        }
    }

    /** Creates a command list.
    - parameters multipleAdapterNodeMask: For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) for which to create the command list. Each bit in the mask corresponds to a single node. Only one bit must be set. Also see Multi-adapter systems.
    - parameters type: Specifies the type of command list to create.
    - parameters commandAllocator: A pointer to the command allocator object from which the device creates command lists.
    - parameters initialState: An optional pointer to the pipeline state object that contains the initial pipeline state for the command list. If it is nulltpr, then the runtime sets a dummy initial pipeline state, so that drivers don't have to deal with undefined state. The overhead for this is low, particularly for a command list, for which the overall cost of recording the command list likely dwarfs the cost of a single initial state setting. So there's little cost in not setting the initial pipeline state parameter, if doing so is inconvenient. For bundles, on the other hand, it might make more sense to try to set the initial state parameter (since bundles are likely smaller overall, and can be reused frequently).
    */
    public func createCommandList(multipleAdapterNodeMask: UInt32 = 0, 
                           type: CommandListType,
                           commandAllocator: CommandAllocator,
                           initialState: PipelineState? = nil) throws -> CommandList {
        return try perform(as: RawValue.self) {pThis in
            let nodeMask = multipleAdapterNodeMask
            let type = type.rawValue
            let pCommandAllocator = try commandAllocator.perform(as: CommandAllocator.RawValue.self){$0}
            var ppCommandList: UnsafeMutableRawPointer?
            let pInitialState = try initialState?.perform(as: PipelineState.RawValue.self){$0}
            var riid = CommandList.interfaceID
            try pThis.pointee.lpVtbl.pointee.CreateCommandList(pThis, nodeMask, type, pCommandAllocator, pInitialState, &riid, &ppCommandList).checkResult()
            guard let p = ppCommandList else {throw Error(.invalidArgument)}
            return CommandList(win32Pointer: p)
        }
    }

    /** Creates a command queue.
    - parameter description: Specifies a D3D12_COMMAND_QUEUE_DESC that describes the command queue.
    */
    public func createCommandQueue(description: CommandQueueDescription) throws -> CommandQueue {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = CommandQueue.interfaceID
            var ppCommandQueue: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommandQueue(pThis, &pDesc, &riid, &ppCommandQueue).checkResult()
            guard let p = ppCommandQueue else {throw Error(.invalidArgument)}
            return CommandQueue(win32Pointer: p)
        }
    }

    /** This method creates a command signature.
    - parameter description: Describes the command signature to be created with the D3D12_COMMAND_SIGNATURE_DESC structure.
    - parameter rootSignature: Specifies the ID3D12RootSignature that the command signature applies to. The root signature is required if any of the commands in the signature will update bindings on the pipeline. If the only command present is a draw or dispatch, the root signature parameter can be set to NULL.
    */
    public func createCommandSignature(description: CommandSignatureDescription, rootSignature: RootSignature?) throws -> CommandSignature {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            let pRootSignature = try rootSignature?.perform(as: RootSignature.RawValue.self) {$0}
            var riid = CommandSignature.interfaceID
            var ppCommandSignature: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommandSignature(pThis, &pDesc, pRootSignature, &riid, &ppCommandSignature).checkResult()
            guard let p = ppCommandSignature else {throw Error(.invalidArgument)}
            return CommandSignature(win32Pointer: p)
        }
    }

    /** Creates both a resource and an implicit heap, such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC structure that describes the resource.
    - parameter properties: A pointer to a D3D12_HEAP_PROPERTIES structure that provides properties for the resource's heap.
    - parameter flags: Heap options, as a bitwise-OR'd combination of D3D12_HEAP_FLAGS enumeration constants.
    - parameter state: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants. When you create a resource together with a D3D12_HEAP_TYPE_UPLOAD heap, you must set InitialResourceState to D3D12_RESOURCE_STATE_GENERIC_READ. When you create a resource together with a D3D12_HEAP_TYPE_READBACK heap, you must set InitialResourceState to D3D12_RESOURCE_STATE_COPY_DEST.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE structure that describes the default value for a clear color.
    */
    public func createCommittedResource(description: ResourceDescription,
                                        properties: HeapProperties,
                                        flags: HeapFlags = [],
                                        state: ResourceStates,
                                        clearColor: ClearValue) throws -> Resource {
        return try perform(as: RawValue.self) {pThis in
            var pHeapProperties = properties.rawValue
            let HeapFlags = HeapFlags.RawType(flags.rawValue)
            var pDesc = description.rawValue
            let InitialResourceState = ResourceStates.RawType(state.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            var riidResource = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommittedResource(pThis, &pHeapProperties, HeapFlags, &pDesc, InitialResourceState, &pOptimizedClearValue, &riidResource, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** Creates a compute pipeline state object.
    - parameter: A pointer to a D3D12_COMPUTE_PIPELINE_STATE_DESC structure that describes compute pipeline state.
    */
    public func createComputePipelineState(description: ComputePipelineStateDescription) throws -> PipelineState {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = PipelineState.interfaceID
            var ppComputePipelineState: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateComputePipelineState(pThis, &pDesc, &riid, &ppComputePipelineState).checkResult()
            guard let p = ppComputePipelineState else {throw Error(.invalidArgument)}
            return PipelineState(win32Pointer: p)
        }
    }

    /** Creates a constant-buffer view for accessing resource data.
    - parameter description: A pointer to a D3D12_CONSTANT_BUFFER_VIEW_DESC structure that describes the constant-buffer view.
    - parameter destination: Describes the CPU descriptor handle that represents the start of the heap that holds the constant-buffer view.
    */
    public func CreateConstantBufferView(description: ConstantBufferViewDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateConstantBufferView(pThis, &pDesc, destination.rawValue)
        }
    }

    /** Creates a depth-stencil view for accessing resource data.
    - parameter resource: A pointer to the ID3D12Resource object that represents the depth stencil. At least one of pResource or pDesc must be provided. A null pResource is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid pDesc in order to determine the descriptor type.
    - parameter description: A pointer to a D3D12_DEPTH_STENCIL_VIEW_DESC structure that describes the depth-stencil view. A null pDesc is used to initialize a default descriptor, if possible. This behavior is identical to the D3D11 null descriptor behavior, where defaults are filled in. This behavior inherits the resource format and dimension (if not typeless) and DSVs target the first mip and all array slices. Not all resources support null descriptor initialization.
    - parameter destination: Describes the CPU descriptor handle that represents the start of the heap that holds the depth-stencil view.
    */
    public func createDepthStencilView(resource: Resource, description: DepthStencilViewDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateDepthStencilView(pThis, pResource, &pDesc, destination.rawValue)
        }
    }

    /** Creates a descriptor heap object.
    - parameter description: A pointer to a D3D12_DESCRIPTOR_HEAP_DESC structure that describes the heap.
    */
    public func createDescriptorHeap(description: DescriptorHeapDescription) throws -> DescriptorHeap {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = DescriptorHeap.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateDescriptorHeap(pThis, &pDesc, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return DescriptorHeap(win32Pointer: p)
        }
    }

    /** Creates a fence object.
    - parameter initialValue: The initial value for the fence.
    - parameter flags: A combination of D3D12_FENCE_FLAGS-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the fence.
    */
    public func createFence(initialValue: UInt64, flags: FenceFlags) throws -> Fence {
        return try perform(as: RawValue.self) {pThis in
            let InitialValue = initialValue
            let Flags = FenceFlags.RawType(flags.rawValue)
            var riid = Fence.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateFence(pThis, InitialValue, Flags, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return Fence(win32Pointer: p)
        }
    }

    /** Creates a graphics pipeline state object.
    - parameter description: A pointer to a D3D12_GRAPHICS_PIPELINE_STATE_DESC structure that describes graphics pipeline state.
    */
    public func createGraphicsPipelineState(description: GraphicsPipelineStateDescription) throws -> PipelineState {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = DescriptorHeap.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateGraphicsPipelineState(pThis, &pDesc, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return PipelineState(win32Pointer: p)
        }
    }

    /** Creates a heap that can be used with placed resources and reserved resources.
    - parameter description: A pointer to a constant D3D12_HEAP_DESC structure that describes the heap.
    */
    public func createHeap(description: HeapDescription) throws -> Heap {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = Heap.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateHeap(pThis, &pDesc, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return Heap(win32Pointer: p)
        }
    }

    /** Creates a resource that is placed in a specific heap. Placed resources are the lightest weight resource objects available, and are the fastest to create and destroy.
    - parameter heap: A pointer to the ID3D12Heap interface that represents the heap in which the resource is placed.
    - parameter offset: The offset, in bytes, to the resource. The HeapOffset must be a multiple of the resource's alignment, and HeapOffset plus the resource size must be smaller than or equal to the heap size. GetResourceAllocationInfo must be used to understand the sizes of texture resources.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC structure that describes the resource.
    - parameter initialState: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants. When a resource is created together with a D3D12_HEAP_TYPE_UPLOAD heap, InitialState must be D3D12_RESOURCE_STATE_GENERIC_READ. When a resource is created together with a D3D12_HEAP_TYPE_READBACK heap, InitialState must be D3D12_RESOURCE_STATE_COPY_DEST.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE that describes the default value for a clear color.
    */
    public func createPlacedResource(heap: Heap, 
                                     offset: UInt64, 
                                     description: ResourceDescription,
                                     initialState: ResourceStates,
                                     clearColor: ClearValue) throws -> Resource {
        return try perform(as: RawValue.self) {pThis in
            let pHeap = try heap.perform(as: Heap.RawValue.self) {$0}
            let HeapOffset = offset
            var pDesc = description.rawValue
            let InitialState = ResourceStates.RawType(initialState.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            var riid = Resource.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreatePlacedResource(pThis, pHeap, HeapOffset, &pDesc, InitialState, &pOptimizedClearValue, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** Creates a query heap. A query heap contains an array of queries.
    - parameter description: Specifies the query heap in a D3D12_QUERY_HEAP_DESC structure.
    */
    public func createQueryHeap(description: QueryHeapDescription) throws -> QueryHeap {
       return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            var riid = QueryHeap.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateQueryHeap(pThis, &pDesc, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return QueryHeap(win32Pointer: p)
        }
    }

    /** Creates a render-target view for accessing resource data.
    - paramter resource: A pointer to the ID3D12Resource object that represents the render target. At least one of pResource or pDesc must be provided. A null pResource is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid pDesc in order to determine the descriptor type.
    - parameter description: A pointer to a D3D12_RENDER_TARGET_VIEW_DESC structure that describes the render-target view.
    - parameter destination: Describes the CPU descriptor handle that represents the destination where the newly-created render target view will reside.
    */
    public func createRenderTargetView(resource: Resource, description: RenderTargetViewDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateRenderTargetView(pThis, pResource, &pDesc, destination.rawValue)
        }
    }

    /** Creates a resource that is reserved, and not yet mapped to any pages in a heap.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC structure that describes the resource.
    - parameter initialState: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE structure that describes the default value for a clear color.
    */
    public func createReservedResource(description: ResourceDescription,
                                       initialState: ResourceStates,
                                       clearColor: ClearValue) throws -> Resource {
        return try perform(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            let InitialState = ResourceStates.RawType(initialState.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            var riid = Resource.interfaceID
            var pp: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateReservedResource(pThis, &pDesc, InitialState, &pOptimizedClearValue, &riid, &pp).checkResult()
            guard let p = pp else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** Creates a root signature layout.
    - parameter multipleAdapterNodeMask: For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the device's physical adapters) to which the root signature is to apply. Each bit in the mask corresponds to a single node. Refer to Multi-adapter systems.
    - parameter description: The description of the root signature, as a pointer to a D3D12_ROOT_SIGNATURE_DESC structure.
    - parameter version: A D3D_ROOT_SIGNATURE_VERSION-typed value that specifies the version of root signature.
    */
    public func createRootSignature(multipleAdapterNodeMask: UInt32 = 0,
                                    description: RootSignatureDescription,
                                    version: RootSignatureVersion) throws -> RootSignature {
        return try perform(as: RawValue.self) {pThis in
            var pRootSignature = description.rawValue
            var ppBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
            var ppErrorBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
            try WinSDK.D3D12SerializeRootSignature(&pRootSignature, version.rawValue, &ppBlob, &ppErrorBlob).checkResult()
            guard let buffer = ppBlob?.pointee.lpVtbl.pointee.GetBufferPointer(ppBlob) else {throw Error(.invalidArgument)}
            guard let bufferSize = ppBlob?.pointee.lpVtbl.pointee.GetBufferSize(ppBlob) else {throw Error(.invalidArgument)}
            var riid = RootSignature.interfaceID
            var ppCommandSignature: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateRootSignature(pThis, multipleAdapterNodeMask, buffer, bufferSize, &riid, &ppCommandSignature).checkResult()
            guard let p = ppCommandSignature else {throw Error(.invalidArgument)}
            return RootSignature(win32Pointer: p)
        }
    }

    /** Create a sampler object that encapsulates sampling information for a texture.
    - parameter description: A pointer to a D3D12_SAMPLER_DESC structure that describes the sampler.
    - parameter destination: Describes the CPU descriptor handle that represents the start of the heap that holds the sampler.
    */
    public func createSampler(description: SamplerDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateSampler(pThis, &pDesc, destination.rawValue)
        }
    }

    /** Creates a shader-resource view for accessing data in a resource.
    - parameter resource: A pointer to the ID3D12Resource object that represents the shader resource. At least one of pResource or pDesc must be provided. A null pResource is used to initialize a null descriptor, which guarantees D3D11-like null binding behavior (reading 0s, writes are discarded), but must have a valid pDesc in order to determine the descriptor type.
    - parameter description: A pointer to a D3D12_SHADER_RESOURCE_VIEW_DESC structure that describes the shader-resource view.
    - parameter destination: Describes the CPU descriptor handle that represents the shader-resource view. This handle can be created in a shader-visible or non-shader-visible descriptor heap.
    */
    public func createShaderResourceView(resource: Resource, description: ShaderResourceViewDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateShaderResourceView(pThis, pResource, &pDesc, destination.rawValue)
        }
    }

    //TODO: Add SECURITY_ATTRIBUTES
    /** Creates a shared handle to an heap, resource, or fence object.
    - parameter object: A pointer to the ID3D12DeviceChild interface that represents the heap, resource, or fence object to create for sharing. The following interfaces (derived from ID3D12DeviceChild) are supported:
    - parameter name: A NULL-terminated UNICODE string that contains the name to associate with the shared heap. The name is limited to MAX_PATH characters. Name comparison is case-sensitive. If Name matches the name of an existing resource, CreateSharedHandle fails with DXGI_ERROR_NAME_ALREADY_EXISTS. This occurs because these objects share the same namespace. The name can have a "Global" or "Local" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\). For more information, see Kernel Object Namespaces. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
    */
    public func createSharedHandle(object: DeviceChild, name: String) throws -> UnsafeMutableRawPointer {
        return try perform(as: RawValue.self) {pThis in
            let pObject = try object.perform(as: DeviceChild.RawValue.self) {$0}
            let pAttributes: UnsafeMutablePointer<SECURITY_ATTRIBUTES>? = nil
            let ACCESS = DWORD(WinSDK.GENERIC_ALL)
            let Name = name.lpcwstr
            var handle: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateSharedHandle(pThis, pObject, pAttributes, ACCESS, Name, &handle).checkResult()
            guard let handle = handle else {throw Error(.invalidArgument)}
            return handle
        }
    }

    /** Creates a view for unordered accessing.
    - parameter resource: A pointer to the ID3D12Resource object that represents the unordered access.
    - parameter counter: The ID3D12Resource for the counter (if any) associated with the UAV. If pCounterResource is not specified, then the CounterOffsetInBytes member of the D3D12_BUFFER_UAV structure must be 0.
    - parameter description: A pointer to a D3D12_UNORDERED_ACCESS_VIEW_DESC structure that describes the unordered-access view.
    - parameter destination: Describes the CPU descriptor handle that represents the start of the heap that holds the unordered-access view.
    */
    public func createUnorderedAccessView(resource: Resource, counter: Resource, description: UnorderedAccessViewDescription, destination: CPUDescriptorHandle) {
        performFatally(as: RawValue.self) {pThis in
            let pResource = resource.performFatally(as: Resource.RawValue.self) {$0}
            let pCounterResource = counter.performFatally(as: Resource.RawValue.self) {$0}
            var pDesc = description.rawValue
            pThis.pointee.lpVtbl.pointee.CreateUnorderedAccessView(pThis, pResource, pCounterResource, &pDesc, destination.rawValue)
        }
    }

    /** Enables the page-out of data, which precludes GPU access of that data.
    - parameter objects: A pointer to a memory block that contains an array of ID3D12Pageable interface pointers for the objects. Even though most D3D12 objects inherit from ID3D12Pageable, residency changes are only supported on the following objects: Descriptor Heaps, Heaps, Committed Resources, and Query Heaps
    */
    public func evict(_ objects: [Pageable]) throws {
        try perform(as: RawValue.self) {pThis in 
            let NumObjects = UInt32(objects.count)
            var ppObjects = try objects.map({try $0.perform(as: Pageable.RawValue.self) {Optional($0)}})
            try pThis.pointee.lpVtbl.pointee.Evict(pThis, NumObjects, &ppObjects).checkResult()
        }
    }

    /** Gets the size and alignment of memory required for a collection of resources on this adapter.
    - parameter multipleAdapterNodeMask: For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see Multi-adapter systems.
    - parameter descriptors: An array of D3D12_RESOURCE_DESC structures that described the resources to get info about.
    */
    public func resourceAllocationInfo(multipleAdapterNodeMask: UInt32 = 0, 
                                       descriptors: [ResourceDescription]) -> ResourceAllocationInfo {
        return performFatally(as: RawValue.self) {pThis in
            let visibleMask = multipleAdapterNodeMask
            let numResourceDescs = UInt32(descriptors.count)
            let pResourceDescs = descriptors.map({$0.rawValue})
            let v = pThis.pointee.lpVtbl.pointee.GetResourceAllocationInfo(pThis, visibleMask, numResourceDescs, pResourceDescs)
            return ResourceAllocationInfo(v)
        }
    }

    public func resourceTiling(for resource: Resource, start: UInt32, count: UInt32) -> (tilesNeeded: UInt32, 
                                                                                         mipInfo: PackedMipInfo, 
                                                                                         shape: TileShape,
                                                                                         retrieved: UInt32, 
                                                                                         tiling: SubresourceTiling) {
        // https://docs.microsoft.com/en-us/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourcetiling
        fatalError("no implementation")
    }

    /// Gets a locally unique identifier for the current device (adapter).
    public var adapterLUID: WinSDK.LUID {
        return performFatally(as: RawValue.self) {pThis in
            return pThis.pointee.lpVtbl.pointee.GetAdapterLuid(pThis)
        }
    }

    /** Makes objects resident for the device.
    - parameter objects: A pointer to a memory block that contains an array of ID3D12Pageable interface pointers for the objects. Even though most D3D12 objects inherit from ID3D12Pageable, residency changes are only supported on the following objects: Descriptor Heaps, Heaps, Committed Resources, and Query Heaps
    */
    public func makeResident(_ objects: [Pageable]) throws {
        try perform(as: RawValue.self) {pThis in 
            let NumObjects = UInt32(objects.count)
            var ppObjects = try objects.map({try $0.perform(as: Pageable.RawValue.self) {Optional($0)}})
            try pThis.pointee.lpVtbl.pointee.MakeResident(pThis, NumObjects, &ppObjects).checkResult()
        }
    }

    /** Opens a handle for shared resources, shared heaps, and shared fences, by using HANDLE and REFIID.
    - parameter handle: The handle that was output by the call to ID3D12Device::CreateSharedHandle.
    - parameter type: The globally unique identifier (GUID) for one of the following interfaces: ID3D12Heap, ID3D12Resource, ID3D12Fence
    - returns: The REFIID, or GUID, of the interface can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D12Heap) will get the GUID of the interface to a resource.
    */
    public func openSharedHandle<T: Pageable>(_ handle: UnsafeMutableRawPointer, for type: T.Type) throws -> T {
        return try perform(as: RawValue.self) {pThis in
            var riid: WinSDK.IID = try {
                if type == Heap.self {
                    return Heap.interfaceID
                }else if type == Resource.self {
                    return Resource.interfaceID
                }else if type == Fence.self {
                    return Fence.interfaceID
                }else{
                    throw Error(.invalidArgument)
                }
            }()
            var p: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.OpenSharedHandle(pThis, handle, &riid, &p).checkResult()
            guard let p = p else {throw Error(.invalidArgument)}
            if type == Heap.self {
                return Heap(win32Pointer: p) as! T
            }else if type == Resource.self {
                return Resource(win32Pointer: p) as! T
            }else if type == Fence.self {
                return Fence(win32Pointer: p) as! T
            }else{
                throw Error(.invalidArgument)
            }
        }
    }

    /** Opens a handle for shared resources, shared heaps, and shared fences, by using Name and Access.
    - parameter name: The name that was optionally passed as the Name parameter in the call to ID3D12Device::CreateSharedHandle.
    - returns: Pointer to the shared handle.
    */
    public func openSharedHandle(byName name: String) throws -> UnsafeMutableRawPointer {
        return try perform(as: RawValue.self) {pThis in
            let Name = name.lpcwstr
            let Access = DWORD(WinSDK.GENERIC_ALL)
            var p: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.OpenSharedHandleByName(pThis, Name, Access, &p).checkResult()
            guard let p = p else {throw Error(.invalidArgument)}
            return p
        }
    }

    /** A development-time aid for certain types of profiling and experimental prototyping.
    - parameter enabled: Specifies a BOOL that turns the stable power state on or off.
    */
    public func setStablePowerState(enabled: Bool) throws {
        try perform(as: RawValue.self) {pThis in
            let Enable = WindowsBool(booleanLiteral: enabled)
            try pThis.pointee.lpVtbl.pointee.SetStablePowerState(pThis, Enable).checkResult()
        }
    }

    override class var interfaceID: WinSDK.IID {
        if #available(Windows 10.0.17763, *) {
            return RawValue5.interfaceID //ID3D12Device5
        }else if #available(Windows 10.0.17134, *) {
            return RawValue4.interfaceID //ID3D12Device4
        }else if #available(Windows 10.0.16299, *) {
            return RawValue3.interfaceID //ID3D12Device3
        }else if #available(Windows 10.0.15063, *) {
            return RawValue2.interfaceID //ID3D12Device2
        }else if #available(Windows 10.0.14393, *) {
            return RawValue1.interfaceID //ID3D12Device1
        }else{
            return RawValue.interfaceID  //ID3D12Device
        }
    }
}

extension Device {
    typealias RawValue = WinSDK.ID3D12Device
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    } 
}
extension Device.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device}
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device = Device 

public extension Device {
    @available(*, unavailable, renamed: "commandListType")
    func GetType() -> CommandListType.RawValue {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "supports")
    func CheckFeatureSupport(_ Feature: Feature, _ pFeatureSupportData: UnsafeMutableRawPointer?, _ FeatureSupportDataSize: UInt32) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyDescriptors")
    func CopyDescriptors(_ NumDestDescriptorRanges: UInt32,
                         _ pDestDescriptorRangeStarts: UnsafePointer<CPUDescriptorHandle>?,
                         _ pDestDescriptorRangeSizes: UnsafePointer<UInt32>,
                         _ NumSrcDescriptorRanges: UInt32,
                         _ pSrcDescriptorRangeStarts: UnsafePointer<CPUDescriptorHandle>?,
                         _ pSrcDescriptorRangeSizes: UnsafeMutablePointer<UInt32>?,
                         _ DescriptorHeapsType: DescriptorHeapType) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "copyDescriptors")
    func CopyDescriptorsSimple(_ NumDestDescriptors: UInt32,
                               _ pDestDescriptorRangeStart: CPUDescriptorHandle,
                               _ pSrcDescriptorRangeStart: CPUDescriptorHandle,
                               _ DescriptorHeapsType: DescriptorHeapType) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommandAllocator")
    func CreateCommandAllocator(_ type: CommandListType, _ riid: UnsafePointer<WinSDK.IID>?, _ ppCommandAllocator: UnsafeMutablePointer<UnsafeMutableRawPointer?>?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommandList")
    func CreateCommandList(_ nodeMask: UInt32,
                           _ type: CommandListType,
                           _ pCommandAllocator: UnsafeMutablePointer<CommandAllocator>,
                           _ pInitialState: UnsafeMutablePointer<PipelineState>?,
                           _ riid: UnsafePointer<WinSDK.IID>?,
                           _ ppCommandList: UnsafeMutablePointer<UnsafeMutableRawPointer?>?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommandQueue")
    func CreateCommandQueue(_ pDesc: UnsafePointer<CommandQueueDescription>, 
                            _ riid: UnsafePointer<WinSDK.IID>?, 
                            _ ppCommandQueue: UnsafeMutablePointer<UnsafeMutableRawPointer?>?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommandSignature")
    func CreateCommandSignature(_ pDesc: UnsafePointer<CommandSignatureDescription>, 
                                _ pRootSignature: UnsafeMutablePointer<RootSignature>,
                                _ riid: UnsafePointer<WinSDK.IID>?,
                                _ ppvCommandSignature: UnsafeMutablePointer<UnsafeMutableRawPointer?>?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommittedResource")
    func CreateCommittedResource(_ pHeapProperties: Any,
                                 _ HeapFlags: Any,
                                 _ pDesc: Any,
                                 _ InitialResourceState: Any,
                                 _ pOptimizedClearValue: Any,
                                 _ riidResource: Any,
                                 _ ppvResource: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createComputePipelineState")
    func CreateComputePipelineState(_ pDesc: Any,
                                    _ riidResource: Any,
                                    _ ppvResource: inout Any?) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createConstantBufferView")
    func CreateConstantBufferView(_ pDesc: Any,
                                  _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createDepthStencilView")
    func CreateDepthStencilView(_ pResource: Any,
                                _ pDesc: Any,
                                _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createDescriptorHeap")
    func CreateDescriptorHeap(_ pDesc: Any,
                              _ riid: Any,
                              _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createFence")
    func CreateFence(_ InitialValue: Any,
                     _ Flags: Any,
                     _ riid: Any,
                     _ ppFence: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createGraphicsPipelineState")
    func CreateGraphicsPipelineState(_ pDesc: Any,
                                     _ riid: Any,
                                     _ ppPipelineState: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createHeap")
    func CreateHeap(_ pDesc: Any,
                    _ riid: Any,
                    _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createPlacedResource")
    func CreatePlacedResource(_ pHeap: Any,
                              _ HeapOffset: Any,
                              _ pDesc: Any,
                              _ InitialState: Any,
                              _ pOptimizedClearValue: Any,
                              _ riid: Any,
                              _ ppvResource: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createQueryHeap")
    func CreateQueryHeap(_ pDesc: Any,
                         _ riid: Any,
                         _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createRenderTargetView")
    func CreateRenderTargetView(_ pResource: Any,
                                _ pDesc: Any,
                                _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createReservedResource")
    func CreateReservedResource(_ pDesc: Any,
                              _ InitialState: Any,
                              _ pOptimizedClearValue: Any,
                              _ riid: Any,
                              _ ppvResource: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createRootSignature")
    func CreateRootSignature(_ nodeMask: Any,
                             _ pBlobWithRootSignature: Any,
                             _ blobLengthInBytes: Any,
                             _ riid: Any,
                             _ ppvRootSignature: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createSampler")
    func CreateSampler(_ pDesc: Any,
                       _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createShaderResourceView")
    func CreateShaderResourceView(_ pResource: Any,
                                  _ pDesc: Any,
                                  _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createSharedHandle")
    func CreateSharedHandle(_ pObject: Any,
                            _ pAttributes: Any,
                            _ Access: Any,
                            _ Name: Any,
                            _ pHandle: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createUnorderedAccessView")
    func CreateUnorderedAccessView(_ pResource: Any,
                                   _ pCounterResource: Any,
                                   _ pDesc: Any,
                                   _ DestDescriptor: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "evict")
    func Evict(_ NumObjects: Any,
               _ ppObjects: inout Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "resourceAllocationInfo")
    func GetResourceAllocationInfo(_ visibleMask: Any,
                                   _ numResourceDescs: Any,
                                   _ pResourceDescs: Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "resourceTiling")
    func GetResourceTiling(_ pTiledResource: Any,
                           _ pNumTilesForEntireResource: inout Any,
                           _ pPackedMipDesc: inout Any,
                           _ pStandardTileShapeForNonPackedMips: inout Any,
                           _ pNumSubresourceTilings: Any,
                           _ FirstSubresourceTilingToGet: Any,
                           _ pSubresourceTilingsForNonPackedMips: inout Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "adapterLUID")
    func GetAdapterLuid() -> WinSDK.LUID {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "makeResident")
    func MakeResident(_ NumObjects: Any,
                      _ ppObjects: inout Any) {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "openSharedHandle")
    func OpenSharedHandle(_ pObject: Any,
                          _ riid: Any,
                          _ ppvObj: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "openSharedHandle(byName:)")
    func OpenSharedHandleByName(_ Name: Any,
                                _ Access: Any,
                                _ pNTHandle: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setStablePowerState(enabled:)")
    func SetStablePowerState(_ Enable: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
