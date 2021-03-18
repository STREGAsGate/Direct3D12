/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import Foundation
import WinSDK

@available(Windows, introduced: 10.0.14393)
public extension Device {
    
    /** Creates a cached pipeline library. For pipeline state objects (PSOs) that are expected to share data together, grouping them into a library before serializing them means that there's less overhead due to metadata, as well as the opportunity to avoid redundant or duplicated data from being written to disk.
    - parameter data: If the input library blob is empty, then the initial content of the library is empty. If the input library blob is not empty, then it is validated for integrity, parsed, and the pointer is stored. The pointer provided as input to this method must remain valid for the lifetime of the object returned. For efficiency reasons, the data is not copied.
    - note: The Swift implimentation of PipelineLibrary keeps a strong reference to the `data` if provided.
    */
    func createPipelineLibrary(with data: Data? = nil) throws -> PipelineLibrary {
        return try perform(as: RawValue1.self) {pThis in
            if let data = data {
                return try data.withUnsafeBytes() {pLibraryBlob in
                    let BlobLength = WinSDK.SIZE_T(pLibraryBlob.count)
                    var riid = PipelineLibrary.interfaceID
                    var p: UnsafeMutableRawPointer?
                    try pThis.pointee.lpVtbl.pointee.CreatePipelineLibrary(pThis, pLibraryBlob.baseAddress, BlobLength, &riid, &p).checkResult()
                    guard let p = p else {throw Error(.invalidArgument)}
                    return PipelineLibrary(win32Pointer: p, data: data)
                }
            }else{
                let BlobLength: WinSDK.SIZE_T = 0
                var riid = PipelineLibrary.interfaceID
                var p: UnsafeMutableRawPointer?
                try pThis.pointee.lpVtbl.pointee.CreatePipelineLibrary(pThis, nil, BlobLength, &riid, &p).checkResult()
                guard let p = p else {throw Error(.invalidArgument)}
                return PipelineLibrary(win32Pointer: p, data: nil)
            }
        }
    }

    /** Specifies an event that should be fired when one or more of a collection of fences reach specific values.
    - parameter fences: An array of length NumFences that specifies the ID3D12Fence objects.
    - parameter fenceValues: An array of length NumFences that specifies the fence values required for the event is to be signaled.
    - parameter flags: Specifies one of the D3D12_MULTIPLE_FENCE_WAIT_FLAGS that determines how to proceed.
    - parameter event: A handle to the event object.
    */
    func setEventOnMultipleFenceCompletion(fences: [Fence], fenceValues: [UInt64], flags: MultipleFenceWaitFlags, event: UnsafeMutableRawPointer) throws {
        try perform(as: RawValue1.self) {pThis in
            let ppFences = try fences.map{try $0.perform(as: Fence.RawValue.self){Optional($0)}}
            let pFenceValues = fenceValues
            let NumFences = UInt32(fences.count)
            let flags = MultipleFenceWaitFlags.RawType(flags.rawValue)
            let hEvent = event
            try pThis.pointee.lpVtbl.pointee.SetEventOnMultipleFenceCompletion(pThis, ppFences, pFenceValues, NumFences, flags, hEvent).checkResult()
        }
    }

    /** This method sets residency priorities of a specified list of objects.
    - parameter objects: Specifies an array, of length NumObjects, containing references to ID3D12Pageable objects.
    - parameter priorities: Specifies an array, of length NumObjects, of D3D12_RESIDENCY_PRIORITY values for the list of objects.
    */
    func setResidencyPriority(for objects: [Pageable], with priorities: [ResidencyPriority]) throws {
        try perform(as: RawValue1.self) {pThis in
            let NumObjects = UInt32(objects.count)
            let ppObjects = try objects.map{try $0.perform(as: Pageable.RawValue.self){Optional($0)}}
            let pPriorities = priorities.map({$0.rawValue})
            try pThis.pointee.lpVtbl.pointee.SetResidencyPriority(pThis, NumObjects, ppObjects, pPriorities).checkResult()
        }
    }
}

@available(Windows, introduced: 10.0.14393)
extension Device {
    typealias RawValue1 = WinSDK.ID3D12Device1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    } 
}
@available(Windows, introduced: 10.0.14393)
extension Device.RawValue1 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.14393)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device1 = Device

@available(Windows, introduced: 10.0.14393)
extension Device {
    @available(*, unavailable, renamed: "createPipelineLibrary")
    func CreatePipelineLibrary(_ pLibraryBlob: Any,
                               _ BlobLength: Any,
                               _ riid: Any,
                               _ ppPipelineLibrary: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setEventOnMultipleFenceCompletion")
    func SetEventOnMultipleFenceCompletion(_ ppFences: Any,
                                           _ pFenceValues: Any,
                                           _ NumFences: Any,
                                           _ Flags: Any,
                                           _ hEvent: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "setResidencyPriority")
    func SetResidencyPriority(_ NumObjects: Any,
                              _ ppObjects: Any,
                              _ pPriorities: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
