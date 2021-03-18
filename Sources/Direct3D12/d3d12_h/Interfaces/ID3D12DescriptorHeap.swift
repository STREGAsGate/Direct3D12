/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// A descriptor heap is a collection of contiguous allocations of descriptors, one allocation for every descriptor. Descriptor heaps contain many object types that are not part of a Pipeline State Object (PSO), such as Shader Resource Views (SRVs), Unordered Access Views (UAVs), Constant Buffer Views (CBVs), and Samplers.
public class DescriptorHeap: Pageable {

    /// Gets the CPU descriptor handle that represents the start of the heap.
    public var cpuDescriptorHandleForHeapStart: CPUDescriptorHandle {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetCPUDescriptorHandleForHeapStart(pThis)
            return CPUDescriptorHandle(v)
        }
    }

    /// Gets the descriptor heap description.
    public var descriptorHeapDescription: DescriptorHeapDescription {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
            return DescriptorHeapDescription(v)
        }
    }

    /// Gets the GPU descriptor handle that represents the start of the heap.
    public var gpuDescriptorHandleForHeapStart: GPUDescriptorHandle {
        return performFatally(as: RawValue.self) {pThis in
            let v = pThis.pointee.lpVtbl.pointee.GetGPUDescriptorHandleForHeapStart(pThis)
            return GPUDescriptorHandle(v)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DescriptorHeap {
    typealias RawValue = WinSDK.ID3D12DescriptorHeap
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DescriptorHeap.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12DescriptorHeap}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DescriptorHeap")
public typealias ID3D12DescriptorHeap = DescriptorHeap 

public extension DescriptorHeap {
    @available(*, unavailable, renamed: "cpuDescriptorHandleForHeapStart")
    func GetCPUDescriptorHandleForHeapStart() -> CPUDescriptorHandle {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "descriptorHeapDescription")
    func GetDesc() -> DescriptorHeapDescription {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }

    @available(*, unavailable, renamed: "gpuDescriptorHandleForHeapStart")
    func GetGPUDescriptorHandleForHeapStart() -> GPUDescriptorHandle {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}


#endif
