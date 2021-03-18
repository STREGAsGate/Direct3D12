/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK


@available(Windows, introduced: 10.0.16299)
public extension Device {

    /** Asynchronously makes objects resident for the device.
    - parameter objects: A pointer to a memory block; contains an array of ID3D12Pageable interface pointers for the objects. Even though most D3D12 objects inherit from ID3D12Pageable, residency changes are only supported on the following: descriptor heaps, heaps, committed resources, query heaps
    - parameter fence: A pointer to the fence used to signal when the work is done.
    - parameter value: An unsigned 64-bit value signaled to the fence when the work is done.
    - parameter flags: Controls whether the objects should be made resident if the application is over its memory budget.
    */
    func enqueueMakeResident(objects: [Pageable], fence: Fence, value: UInt64, flags: ResidencyFlags) throws {
        try perform(as: RawValue3.self) {pThis in
            let Flags = ResidencyFlags.RawType(flags.rawValue)
            let NumObjects = UInt32(objects.count)
            let ppObjects = try objects.map({try $0.perform(as: Pageable.RawValue.self){Optional($0)}})
            let pFenceToSignal = try fence.perform(as: Fence.RawValue.self) {$0}
            let FenceValueToSignal = value
            try pThis.pointee.lpVtbl.pointee.EnqueueMakeResident(pThis, Flags, NumObjects, ppObjects, pFenceToSignal, FenceValueToSignal).checkResult()
        }
    }

    /** Creates a special-purpose diagnostic heap in system memory from an address. The created heap can persist even in the event of a GPU-fault or device-removed scenario.
    - parameter address: The address used to create the heap.
    - returns: A pointer to a memory block. On success, the D3D12 runtime will write a pointer to the newly-opened heap into the memory block. The type of the pointer depends on the provided riid parameter.
    */
    func openExistingHeapFromAddress(_ address: UnsafeMutableRawPointer) throws -> Heap {
        return try perform(as: RawValue3.self) {pThis in
            let pAddress = address
            var riid = Heap.interfaceID
            var ppvHeap: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.OpenExistingHeapFromAddress(pThis, pAddress, &riid, &ppvHeap).checkResult()
            guard let p = ppvHeap else {throw Error(.invalidArgument)}
            return Heap(win32Pointer: p)
        }
    }

    /** Creates a special-purpose diagnostic heap in system memory from a file mapping object. The created heap can persist even in the event of a GPU-fault or device-removed scenario.
    - parameter fileMapping: The handle to the file mapping object to use to create the heap.
    - returns: A pointer to a memory block. On success, the D3D12 runtime will write a pointer to the newly-opened heap into the memory block. The type of the pointer depends on the provided riid parameter.
    */
    func openExistingHeapFromFileMapping(_ fileMapping: UnsafeMutableRawPointer) throws -> Heap {
        return try perform(as: RawValue3.self) {pThis in
            let hFileMapping = fileMapping
            var riid = Heap.interfaceID
            var ppvHeap: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.OpenExistingHeapFromFileMapping(pThis, hFileMapping, &riid, &ppvHeap).checkResult()
            guard let p = ppvHeap else {throw Error(.invalidArgument)}
            return Heap(win32Pointer: p)
        }
    }
}

@available(Windows, introduced: 10.0.16299)
extension Device {
    typealias RawValue3 = WinSDK.ID3D12Device3
    convenience init(_ rawValue: inout RawValue3) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.16299)
extension Device.RawValue3 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device3}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.16299)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device3 = Device

@available(Windows, introduced: 10.0.16299)
public extension Device {
    @available(*, unavailable, renamed: "enqueueMakeResident")
    func EnqueueMakeResident(_ Flags: Any,
                             _ NumObjects: Any,
                             _ ppObjects: Any,
                             _ pFenceToSignal: Any,
                             _ FenceValueToSignal: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "openExistingHeapFromAddress")
    func OpenExistingHeapFromAddress(_ pAddress: Any,
                                     _ riid: Any,
                                     _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "openExistingHeapFromFileMapping")
    func OpenExistingHeapFromFileMapping(_ hFileMapping: Any,
                                         _ riid: Any,
                                         _ ppvHeap: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
