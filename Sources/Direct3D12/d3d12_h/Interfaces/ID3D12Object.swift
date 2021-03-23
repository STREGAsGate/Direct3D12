/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// An interface from which ID3D12Device and ID3D12DeviceChild inherit from. It provides methods to associate private data and annotate object names.
public class D3DObject: IUnknown {

    /** Associates a name with the device object. This name is for use in debug diagnostics and tools.
    - parameter string: A NULL-terminated UNICODE string that contains the name to associate with the device object.
    */
    public func setDebugName(_ string: String) throws {
        try perform(as: RawValue.self) {pThis in
            try pThis.pointee.lpVtbl.pointee.SetName(pThis, string.windowsUTF16).checkResult()
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DObject {
    typealias RawValue = WinSDK.ID3D12Object
}
extension D3DObject.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Object}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "D3DObject")
public typealias ID3D12Object = D3DObject

public extension  D3DObject {
    @available(*, unavailable, renamed: "setDebugName(_:)")
    func SetName(_ Name: Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif