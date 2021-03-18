/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, deprecated: 10.0.19041, renamed: "ResourceDescription1")
public struct ResourceDescription {
    internal var rawValue: WinSDK.D3D12_RESOURCE_DESC


    internal init(_ rawValue: WinSDK.D3D12_RESOURCE_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceDescription")
public typealias D3D12_RESOURCE_DESC = ResourceDescription

#endif
