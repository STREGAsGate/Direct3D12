/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.19041)
public struct ProtectedResourceSessionDescription1 {
    public typealias RawValue = WinSDK.D3D12_PROTECTED_RESOURCE_SESSION_DESC1
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.19041)
@available(*, deprecated, renamed: "ProtectedResourceSessionDescription1")
public typealias D3D12_PROTECTED_RESOURCE_SESSION_DESC1 = ProtectedResourceSessionDescription1

#endif
