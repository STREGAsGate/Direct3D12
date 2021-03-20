/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// A descriptor heap is a collection of contiguous allocations of descriptors, one allocation for every descriptor. Descriptor heaps contain many object types that are not part of a Pipeline State Object (PSO), such as Shader Resource Views (SRVs), Unordered Access Views (UAVs), Constant Buffer Views (CBVs), and Samplers.
public class D3DDescriptorHeap: D3DPageable {

    /// Gets the CPU descriptor handle that represents the start of the heap.
    public var cpuDescriptorHandleForHeapStart: D3DCPUDescriptorHandle {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetCPUDescriptorHandleForHeapStart(pThis)
            return D3DCPUDescriptorHandle(v)
        }
    }

    /// Gets the descriptor heap description.
    public var descriptorHeapDescription: D3DDescriptorHeapDescription {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
            return D3DDescriptorHeapDescription(v)
        }
    }

    /// Gets the GPU descriptor handle that represents the start of the heap.
    public var gpuDescriptorHandleForHeapStart: D3DGPUDescriptorHandle {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetGPUDescriptorHandleForHeapStart(pThis)
            return D3DGPUDescriptorHandle(v)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DDescriptorHeap {
    typealias RawValue = WinSDK.ID3D12DescriptorHeap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension D3DDescriptorHeap.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12DescriptorHeap}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDescriptorHeap")
public typealias ID3D12DescriptorHeap = D3DDescriptorHeap 

public extension D3DDescriptorHeap {
    @available(*, unavailable, renamed: "cpuDescriptorHandleForHeapStart")
    func GetCPUDescriptorHandleForHeapStart() -> D3DCPUDescriptorHandle {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "descriptorHeapDescription")
    func GetDesc() -> D3DDescriptorHeapDescription {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "gpuDescriptorHandleForHeapStart")
    func GetGPUDescriptorHandleForHeapStart() -> D3DGPUDescriptorHandle {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}


#endif
