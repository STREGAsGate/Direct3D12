/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public class Object: IUnknown {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension Object {
    typealias RawValue = WinSDK.ID3D12Object
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Object.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Object}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "Object")
public typealias ID3D12Object = Object

#endif