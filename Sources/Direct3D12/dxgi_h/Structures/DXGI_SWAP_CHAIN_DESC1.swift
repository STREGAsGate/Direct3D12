/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct DGISwapChainDescription1 {
    public typealias RawValue = WinSDK.DXGI_SWAP_CHAIN_DESC1
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGISwapChainDescription1")
public typealias DXGI_SWAP_CHAIN_DESC1 = DGISwapChainDescription1

#endif
