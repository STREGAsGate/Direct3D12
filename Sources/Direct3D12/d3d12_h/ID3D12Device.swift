/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK
import _d3d12


///Represents a virtual adapter; it is used to create command allocators, command lists, command queues, fences, resources, 
///pipeline state objects, heaps, root signatures, samplers, and many resource views.
///- Note: Represents `ID3D12Device` from the source API.
open class Device: Object {
    override public class var IID: IID { IID_ID3D12Device }
}

public extension Device {
    ///Reports the number of physical adapters (nodes) that are associated with this device.
    ///- SeeAlso: Made Swift friendly by wrapping original style API `_GetNodeCount()`
    var nodeCount: UInt {
        do {
            let v = try _GetNodeCount()
            return UInt(v)
        }catch{
            fatalError("\(error)")
        }
    }

    ///Reports the number of physical adapters (nodes) that are associated with this device.
    func _GetNodeCount() throws -> WinSDK.UINT {
        return try performComOperation(_d3d12.ID3D12Device.self) { (this, pThis) in
            return this.lpVtbl.pointee.GetNodeCount(pThis)
        }
    }
}
