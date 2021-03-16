/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class Pageable: DeviceChild {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension Pageable {
    typealias RawValue = WinSDK.ID3D12Pageable
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension Pageable.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Pageable}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "Pageable")
public typealias ID3D12Pageable = Pageable 

#endif