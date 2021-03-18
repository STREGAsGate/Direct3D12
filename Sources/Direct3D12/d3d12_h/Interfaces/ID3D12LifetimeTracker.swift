/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

@available(Windows, introduced: 10.0.17763)
public class LifetimeTracker: DeviceChild {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

@available(Windows, introduced: 10.0.17763)
extension LifetimeTracker {
    typealias RawValue = WinSDK.ID3D12LifetimeTracker
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.17763)
extension LifetimeTracker.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12LifetimeTracker}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "LifetimeTracker")
public typealias ID3D12LifetimeTracker = LifetimeTracker 

#endif