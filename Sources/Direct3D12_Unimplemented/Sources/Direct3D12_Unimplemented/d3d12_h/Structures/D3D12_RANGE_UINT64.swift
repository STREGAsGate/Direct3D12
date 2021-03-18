/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct RangeUInt64 {
    internal var rawValue: WinSDK.D3D12_RANGE_UINT64


    internal init(_ rawValue: WinSDK.D3D12_RANGE_UINT64) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RangeUInt64")
public typealias D3D12_RANGE_UINT64 = RangeUInt64

#endif
