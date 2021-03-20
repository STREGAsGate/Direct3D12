/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.17763)
public class LifetimeOwner: IUnknown {
    
    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

@available(Windows, introduced: 10.0.17763)
extension LifetimeOwner {
    typealias RawValue = WinSDK.ID3D12LifetimeOwner
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.17763)
extension LifetimeOwner.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12LifetimeOwner}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "LifetimeOwner")
public typealias ID3D12LifetimeOwner = LifetimeOwner

#endif