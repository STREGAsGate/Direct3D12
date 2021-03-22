/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIDevice: DGIObject {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIDevice {
    typealias RawValue = WinSDK.IDXGIDevice
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DGIDevice.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIDevice}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DGIDevice")
public typealias IDXGIDevice = DGIDevice

public extension DGIDevice {

}

#endif
