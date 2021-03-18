/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.17134)
public class ProtectedResourceSession: ProtectedSession {
    
    override class var interfaceID: WinSDK.IID {
        if #available(Windows 10.0.19041, *) {
            return RawValue1.interfaceID//ID3D12ProtectedResourceSession1
        }else{
            return RawValue.interfaceID //ID3D12ProtectedResourceSession
        }
    }
}

@available(Windows, introduced: 10.0.17134)
extension ProtectedResourceSession {
    typealias RawValue = WinSDK.ID3D12ProtectedResourceSession
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.17134)
extension ProtectedResourceSession.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12ProtectedResourceSession}
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17134)
@available(*, deprecated, renamed: "ProtectedResourceSession")
public typealias ID3D12ProtectedResourceSession = ProtectedResourceSession 

#endif
