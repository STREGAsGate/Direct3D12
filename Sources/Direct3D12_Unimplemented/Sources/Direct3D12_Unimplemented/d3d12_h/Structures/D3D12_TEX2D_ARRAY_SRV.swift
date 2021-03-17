/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct Texture2DArrayShaderResourceView {
    internal var rawValue: WinSDK.D3D12_TEX2D_ARRAY_SRV


    internal init(_ rawValue: WinSDK.D3D12_TEX2D_ARRAY_SRV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Texture2DArrayShaderResourceView")
public typealias D3D12_TEX2D_ARRAY_SRV = Texture2DArrayShaderResourceView

#endif