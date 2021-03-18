/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public extension ProtectedResourceSession {
    
}

extension ProtectedResourceSession {
    typealias RawValue1 = WinSDK.ID3D12ProtectedResourceSession1
    convenience init(_ rawValue: inout RawValue1) {
        self.init(win32Pointer: &rawValue)
    }
}
extension ProtectedResourceSession.RawValue1 {
    static var interfaceID: WinSDK.IID {WinSDK.IID_ID3D12ProtectedResourceSession1}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ProtectedResourceSession")
public typealias ID3D12ProtectedResourceSession1 = ProtectedResourceSession 

#endif
