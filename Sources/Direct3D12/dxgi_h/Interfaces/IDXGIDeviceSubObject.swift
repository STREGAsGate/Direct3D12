/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIDeviceSubObject: DGIObject {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIDeviceSubObject {
    typealias RawValue = WinSDK.IDXGIDeviceSubObject
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DGIDeviceSubObject.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIDeviceSubObject}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DGIDeviceSubObject")
public typealias IDXGIDeviceSubObject = DGIDeviceSubObject

#endif
