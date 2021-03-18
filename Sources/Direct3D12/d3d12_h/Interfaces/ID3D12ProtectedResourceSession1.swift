/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.19041)
public extension ProtectedResourceSession {
    
}

@available(Windows, introduced: 10.0.19041)
extension ProtectedResourceSession {
    typealias RawValue1 = WinSDK.ID3D12ProtectedResourceSession1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.19041)
extension ProtectedResourceSession.RawValue1 {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12ProtectedResourceSession1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "ProtectedResourceSession")
public typealias ID3D12ProtectedResourceSession1 = ProtectedResourceSession 

#endif
