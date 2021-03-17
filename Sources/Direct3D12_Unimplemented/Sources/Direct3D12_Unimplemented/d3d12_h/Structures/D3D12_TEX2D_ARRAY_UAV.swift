/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct Texture2DArrayUnorderedAccessView {
    internal var rawValue: WinSDK.D3D12_TEX2D_ARRAY_UAV


    internal init(_ rawValue: WinSDK.D3D12_TEX2D_ARRAY_UAV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Texture2DArrayUnorderedAccessView")
public typealias D3D12_TEX2D_ARRAY_UAV = Texture2DArrayUnorderedAccessView

#endif