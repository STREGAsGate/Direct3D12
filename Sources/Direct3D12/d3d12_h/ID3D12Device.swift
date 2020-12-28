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
open class Device: Object {
    override public class var IID: IID { IID_ID3D12Device }
}

public extension Device {
    ///Reports the number of physical adapters (nodes) that are associated with this device.
    var nodeCount: UInt32 {
        return performFatally(as: _d3d12.ID3D12Device.self) { sdk in
            return sdk.lpVtbl.GetNodeCount(sdk.pThis)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device = Device

extension Device {
    @available(*, deprecated, renamed: "nodeCount")
    func GetNodeCount() -> WinSDK.UINT {
        return nodeCount
    }
}
#endif

//MARK: - SwiftCOM Helper

fileprivate extension IUnknown.ComManager where WinSDKType == _d3d12.ID3D12Device {
    var lpVtbl: _d3d12.ID3D12DeviceVtbl {
        return this.lpVtbl.pointee
    }
}