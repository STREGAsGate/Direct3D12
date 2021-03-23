/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// An interface from which many other core interfaces inherit from. It indicates that the object type encapsulates some amount of GPU-accessible memory; but does not strongly indicate whether the application can manipulate the object's residency.
public class D3DPageable: D3DDeviceChild {

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension D3DPageable {
    typealias RawValue = WinSDK.ID3D12Pageable
}
extension D3DPageable.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12Pageable}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "D3DPageable")
public typealias ID3D12Pageable = D3DPageable 

#endif