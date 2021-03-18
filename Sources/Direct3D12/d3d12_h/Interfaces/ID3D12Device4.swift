/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import WinSDK.DirectX

@available(Windows, introduced: 10.0.17134)
public extension Device {

    /** Creates a command list in the closed state.
    - parameter multipleAdapterNodeMask: For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) for which to create the command list. Each bit in the mask corresponds to a single node. Only one bit must be set. Also see Multi-adapter systems.
    - parameter type: Specifies the type of command list to create.
    - parameter flags: Specifies creation flags.
    */
    func createCommandList(multipleAdapterNodeMask: UInt32 = 0,
                           type: CommandListType,
                           flags: CommandListFlags = []) throws -> CommandList {
        return try perform(as: RawValue4.self) {pThis in
            let nodeMask = multipleAdapterNodeMask
            let type = type.rawValue
            let flags = CommandListFlags.RawType(flags.rawValue)
            var riid = CommandList.interfaceID
            var ppCommandList: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommandList1(pThis, nodeMask, type, flags, &riid, &ppCommandList).checkResult()
            guard let p = ppCommandList else {throw Error(.invalidArgument)}
            return CommandList(win32Pointer: p)
        }
    }

    /** Creates both a resource and an implicit heap (optionally for a protected session), such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap. Also see ID3D12Device::CreateCommittedResource for a code example.
    - parameter properties: A pointer to a D3D12_HEAP_PROPERTIES structure that provides properties for the resource's heap.
    - parameter HeapFlags: Heap options, as a bitwise-OR'd combination of D3D12_HEAP_FLAGS enumeration constants.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC structure that describes the resource.
    - parameter initialState: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants. When you create a resource together with a D3D12_HEAP_TYPE_UPLOAD heap, you must set InitialResourceState to D3D12_RESOURCE_STATE_GENERIC_READ. When you create a resource together with a D3D12_HEAP_TYPE_READBACK heap, you must set InitialResourceState to D3D12_RESOURCE_STATE_COPY_DEST.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE structure that describes the default value for a clear color.
    - parameter session: An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an ID3D12ProtectedResourceSession by calling ID3D12Device4::CreateProtectedResourceSession.
    */
    func createCommittedResource(properties: HeapProperties,
                                 flags: HeapFlags,
                                 description: ResourceDescription,
                                 initialState: ResourceStates,
                                 clearColor: ClearValue,
                                 session: ProtectedResourceSession?) throws -> Resource {
        return try perform(as: RawValue4.self) {pThis in
            var pHeapProperties = properties.rawValue
            let HeapFlags = HeapFlags.RawType(flags.rawValue)
            var pDesc = description.rawValue
            let InitialResourceState = ResourceStates.RawType(initialState.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            let pProtectedSession = try session?.perform(as: ProtectedResourceSession.RawValue.self) {$0}
            var riidResource = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateCommittedResource1(pThis, &pHeapProperties, HeapFlags, &pDesc, InitialResourceState, &pOptimizedClearValue, pProtectedSession, &riidResource, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** Creates a heap (optionally for a protected session) that can be used with placed resources and reserved resources.
    - parameter description: A pointer to a constant D3D12_HEAP_DESC structure that describes the heap.
    - parameter session: An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the heap should be protected. You can obtain an ID3D12ProtectedResourceSession by calling ID3D12Device4::CreateProtectedResourceSession.
    */
    func createHeap(description: HeapDescription, session: ProtectedResourceSession?) throws -> Heap {
        return try perform(as: RawValue4.self) {pThis in
            var pDesc = description.rawValue
            let pProtectedSession = try session?.perform(as: ProtectedResourceSession.RawValue.self) {$0}
            var riid = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateHeap1(pThis, &pDesc, pProtectedSession, &riid, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Heap(win32Pointer: p)
        }
    }

    /** Creates an object that represents a session for content protection. You can then provide that session when you're creating resource or heap objects, to indicate that they should be protected.
    - parameter description: A pointer to a constant D3D12_PROTECTED_RESOURCE_SESSION_DESC structure, describing the session to create.
    */
    @available(Windows, deprecated: 10.0.19041, message: "Use description type `ProtectedResourceSessionDescription1`.")
    func createProtectedResourceSession(description: ProtectedResourceSessionDescription) throws -> ProtectedResourceSession {
        return try perform(as: RawValue4.self) {pThis in
            var pDesc = description.rawValue
            var riid = ProtectedResourceSession.interfaceID
            var ppSession: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateProtectedResourceSession(pThis, &pDesc, &riid, &ppSession).checkResult()
            guard let p = ppSession else {throw Error(.invalidArgument)}
            return ProtectedResourceSession(win32Pointer: p)
        }
    }

    /** Creates a resource (optionally for a protected session) that is reserved, and not yet mapped to any pages in a heap.
    - parameter description: A pointer to a D3D12_RESOURCE_DESC structure that describes the resource.
    - parameter initialState: The initial state of the resource, as a bitwise-OR'd combination of D3D12_RESOURCE_STATES enumeration constants.
    - parameter clearColor: Specifies a D3D12_CLEAR_VALUE structure that describes the default value for a clear color.
    - parameter session: An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an ID3D12ProtectedResourceSession by calling ID3D12Device4::CreateProtectedResourceSession.
    */
    func createReservedResource(description: ResourceDescription,
                                initialState: ResourceStates,
                                clearColor: ClearValue,
                                session: ProtectedResourceSession?) throws -> Resource {
        return try perform(as: RawValue4.self) {pThis in
            var pDesc = description.rawValue
            let InitialState = ResourceStates.RawType(initialState.rawValue)
            var pOptimizedClearValue = clearColor.rawValue
            let pProtectedSession = try session?.perform(as: ProtectedResourceSession.RawValue.self){$0}
            var riid = Resource.interfaceID
            var ppvResource: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.CreateReservedResource1(pThis, &pDesc, InitialState, &pOptimizedClearValue, pProtectedSession, &riid, &ppvResource).checkResult()
            guard let p = ppvResource else {throw Error(.invalidArgument)}
            return Resource(win32Pointer: p)
        }
    }

    /** Gets rich info about the size and alignment of memory required for a collection of resources on this adapter. Also see ID3D12Device::GetResourceAllocationInfo. In addition to the D3D12_RESOURCE_ALLOCATION_INFO returned from the method, this version also returns an array of D3D12_RESOURCE_ALLOCATION_INFO1 structures, which provide additional details for each resource description passed as input. See the pResourceAllocationInfo1 parameter.
    - parameter multipleAdapterNodeMask: For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see Multi-adapter systems.
    - parameter descriptions: An array of D3D12_RESOURCE_DESC structures that described the resources to get info about.
    - returns info: A D3D12_RESOURCE_ALLOCATION_INFO structure that provides info about video memory allocated for the specified array of resources.
    - returns infos: An array of D3D12_RESOURCE_ALLOCATION_INFO1 structures, containing additional details for each resource description passed as input. This makes it simpler for your application to allocate a heap for multiple resources, and without manually computing offsets for where each resource should be placed.
    */
    @available(Windows, deprecated: 10.0.19041, message: "Use descriptions type ResourceDescription1")
    func resourceAllocationInfo(multipleAdapterNodeMask: UInt32 = 0,
                                descriptions: [ResourceDescription]) -> (info: ResourceAllocationInfo, infos: [ResourceAllocationInfo1]) {
        return performFatally(as: RawValue4.self) {pThis in
            let visibleMask = multipleAdapterNodeMask
            let numResourceDescs = UInt32(descriptions.count)
            var pResourceDescs = descriptions.map({$0.rawValue})
            let pResourceAllocationInfo1 = UnsafeMutableBufferPointer<ResourceAllocationInfo1.RawValue>(start: nil, count: descriptions.count)
            let i = pThis.pointee.lpVtbl.pointee.GetResourceAllocationInfo1(pThis, visibleMask, numResourceDescs, &pResourceDescs, pResourceAllocationInfo1.baseAddress)
            return (ResourceAllocationInfo(i), Array(pResourceAllocationInfo1).map({ResourceAllocationInfo1($0)}))
        }
    }
}

@available(Windows, introduced: 10.0.17134)
extension Device {
    typealias RawValue4 = WinSDK.ID3D12Device4
    convenience init(_ rawValue: inout RawValue4) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.17134)
extension Device.RawValue4 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device4}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17134)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device4 = Device

@available(Windows, introduced: 10.0.17134)
public extension Device {
    @available(*, unavailable, renamed: "createCommandList")
    func CreateCommandList1(_ nodeMask: Any,
                            _ type: Any,
                            _ flags: Any,
                            _ riid: Any,
                            _ ppCommandList: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createCommittedResource")
    func CreateCommittedResource1(_ pHeapProperties: Any,
                                  _ HeapFlags: Any,
                                  _ pDesc: Any,
                                  _ InitialResourceState: Any,
                                  _ pOptimizedClearValue: Any,
                                  _ pProtectedSession: Any,
                                  _ riidResource: Any,
                                  _ ppvResource: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createHeap")
    func CreateHeap1(_ pDesc: Any,
                     _ pProtectedSession: Any,
                     _ riid: Any,
                     _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createProtectedResourceSession")
    func CreateProtectedResourceSession(_ pDesc: Any,
                                        _ riid: Any,
                                        _ ppSession: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "createReservedResource")
    func CreateReservedResource1(_ pDesc: Any, 
                                 _ InitialState: Any,
                                 _ pOptimizedClearValue: Any,
                                 _ pProtectedSession: Any,
                                 _ riid: Any,
                                 _ ppvResource: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "resourceAllocationInfo")
    func GetResourceAllocationInfo1(_ visibleMask: Any, 
                                    _ numResourceDescs: Any,
                                    _ pResourceDescs: Any,
                                    _ pResourceAllocationInfo1: Any) -> ResourceAllocationInfo.RawValue {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
