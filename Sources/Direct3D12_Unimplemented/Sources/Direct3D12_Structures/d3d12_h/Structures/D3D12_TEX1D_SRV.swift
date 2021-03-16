/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct Texture1DShaderResourceView {
    internal var rawValue: WinSDK.D3D12_TEX1D_SRV


    internal init(_ rawValue: WinSDK.D3D12_TEX1D_SRV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Texture1DShaderResourceView")
public typealias D3D12_TEX1D_SRV = Texture1DShaderResourceView

#endif
