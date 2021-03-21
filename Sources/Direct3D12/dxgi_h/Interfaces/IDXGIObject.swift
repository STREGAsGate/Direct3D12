/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class DGIObject: IUnknown {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension DGIObject {
    typealias RawValue = WinSDK.IDXGIObject
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension DGIObject.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IDXGIObject}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "DGIObject")
public typealias IDXGIObject = DGIObject

#endif
