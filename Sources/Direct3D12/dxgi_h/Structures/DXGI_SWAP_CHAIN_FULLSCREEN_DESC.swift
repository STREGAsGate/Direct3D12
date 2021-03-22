/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct DGISwapChainFullscreenDescription {
    public typealias RawValue = WinSDK.DXGI_SWAP_CHAIN_FULLSCREEN_DESC
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGISwapChainFullscreenDescription")
public typealias DXGI_SWAP_CHAIN_FULLSCREEN_DESC = DGISwapChainFullscreenDescription

#endif
