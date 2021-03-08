/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct BlendDesc {
    internal var rawValue: WinSDK.D3D12_BLEND_DESC


    internal init(_ rawValue: WinSDK.D3D12_BLEND_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BlendDesc")
public typealias D3D12_BLEND_DESC = BlendDesc 

#endif
