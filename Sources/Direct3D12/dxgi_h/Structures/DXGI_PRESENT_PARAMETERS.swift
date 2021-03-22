/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct DGPresentParameters {
    public typealias RawValue = WinSDK.DXGI_PRESENT_PARAMETERS
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }

    public static let `fullFrame`: DGPresentParameters = {
        var params = WinSDK.DXGI_PRESENT_PARAMETERS()
        params.DirtyRectsCount = 0
        params.pDirtyRects = nil
        params.pScrollRect = nil
        params.pScrollOffset = nil
        return DGPresentParameters(params)
    }()
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGPresentParameters")
public typealias DXGI_PRESENT_PARAMETERS = DGPresentParameters

#endif
