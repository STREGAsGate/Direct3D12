/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// An interface from which other core interfaces inherit from, including (but not limited to) ID3D12PipelineLibrary, ID3D12CommandList, ID3D12Pageable, and ID3D12RootSignature. It provides a method to get back to the device object it was created against.
public class DeviceChild: Object {

    /** Gets a pointer to the device that created this interface.
    - returns: A pointer to a memory block that receives a pointer to the ID3D12Device interface for the device.
    */
    public func device() throws -> Device {
        return try perform(as: RawValue.self) {pThis in 
            var riid = Device.interfaceID
            var ppvDevice: UnsafeMutableRawPointer?
            try pThis.pointee.lpVtbl.pointee.GetDevice(pThis, &riid, &ppvDevice).checkResult()
            guard let p = ppvDevice else {throw Error(.invalidArgument)}
            return Device(win32Pointer: p)
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DeviceChild {
    typealias RawValue = WinSDK.ID3D12DeviceChild
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DeviceChild.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12DeviceChild}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DeviceChild")
public typealias ID3D12DeviceChild = DeviceChild 

public extension DeviceChild {
    @available(*, unavailable, renamed: "device")
    func GetDevice(_ riid: Any, 
                   _ ppvDevice: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
