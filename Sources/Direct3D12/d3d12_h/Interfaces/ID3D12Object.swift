/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class D3DObject: IUnknown {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DObject {
    typealias RawValue = WinSDK.ID3D12Object
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension D3DObject.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Object}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "D3DObject")
public typealias ID3D12Object = D3DObject

#endif