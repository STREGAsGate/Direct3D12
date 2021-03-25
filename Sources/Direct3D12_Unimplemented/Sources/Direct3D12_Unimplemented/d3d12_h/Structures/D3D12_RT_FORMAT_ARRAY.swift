/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DRenderTargetFormatArray {
    public typealias RawValue = WinSDK.D3D12_RT_FORMAT_ARRAY
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRenderTargetFormatArray")
public typealias D3D12_RT_FORMAT_ARRAY = D3DRenderTargetFormatArray

#endif
