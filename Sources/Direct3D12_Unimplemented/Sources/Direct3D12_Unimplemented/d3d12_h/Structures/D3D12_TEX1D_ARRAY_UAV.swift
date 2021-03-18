/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct Texture1DArrayUnorderedAccessView {
    internal var rawValue: WinSDK.D3D12_TEX1D_ARRAY_UAV


    internal init(_ rawValue: WinSDK.D3D12_TEX1D_ARRAY_UAV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "SamplePosition")
public typealias D3D12_TEX1D_ARRAY_UAV = RenderTargetFormatArray

#endif