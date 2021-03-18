/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public struct ResourceAllocationInfo {
    internal var rawValue: WinSDK.D3D12_RESOURCE_ALLOCATION_INFO


    internal init(_ rawValue: WinSDK.D3D12_RESOURCE_ALLOCATION_INFO) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResourceAllocationInfo")
public typealias D3D12_RESOURCE_ALLOCATION_INFO = ResourceAllocationInfo

#endif
