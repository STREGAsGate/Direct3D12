/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DResourceUnorderedAccessViewBarrier {
    public typealias RawValue = WinSDK.D3D12_RESOURCE_UAV_BARRIER
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DResourceUnorderedAccessViewBarrier")
public typealias D3D12_RESOURCE_UAV_BARRIER = D3DResourceUnorderedAccessViewBarrier

#endif
