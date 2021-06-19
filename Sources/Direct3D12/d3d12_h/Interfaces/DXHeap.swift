/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// A heap is an abstraction of contiguous memory allocation, used to manage physical memory. This heap can be used with ID3D12Resource objects to support placed resources or reserved resources.
public class D3DHeap: D3DPageable {
    
    /// Gets the heap description.
    public var heapDescription: D3DHeapDescription {
        return performFatally(as: RawValue.self) {pThis in
            return D3DHeapDescription(pThis.pointee.lpVtbl.pointee.GetDesc(pThis))
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DHeap {
    typealias RawValue = WinSDK.ID3D12Heap
}
extension D3DHeap.RawValue {
    static var interfaceID: WinSDK.IID {
        return WinSDK.IID_ID3D12Heap
    }
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DHeap")
public typealias ID3D12Heap = D3DHeap

public extension D3DHeap {
    @available(*, unavailable, renamed: "heapDescription")
    func GetDevice() -> D3DHeapDescription {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
