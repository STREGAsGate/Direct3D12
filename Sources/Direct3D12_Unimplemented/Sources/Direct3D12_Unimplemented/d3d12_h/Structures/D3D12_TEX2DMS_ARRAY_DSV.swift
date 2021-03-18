/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct Texture2DMultiSampledArrayDepthStencilView {
    internal var rawValue: WinSDK.D3D12_TEX2DMS_ARRAY_DSV


    internal init(_ rawValue: WinSDK.D3D12_TEX2DMS_ARRAY_DSV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Texture2DMultiSampledArrayDepthStencilView")
public typealias D3D12_TEX2DMS_ARRAY_DSV = Texture2DMultiSampledArrayDepthStencilView

#endif