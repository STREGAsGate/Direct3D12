/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct Texture3DShaderResourceView {
    internal var rawValue: WinSDK.D3D12_TEX3D_SRV


    internal init(_ rawValue: WinSDK.D3D12_TEX3D_SRV) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Texture3DShaderResourceView")
public typealias D3D12_TEX3D_SRV = Texture3DShaderResourceView

#endif