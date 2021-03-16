/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct Viewport {
    internal var rawValue: WinSDK.D3D12_VIEWPORT


    internal init(_ rawValue: WinSDK.D3D12_VIEWPORT) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "Viewport")
public typealias D3D12_VIEWPORT = Viewport

#endif
