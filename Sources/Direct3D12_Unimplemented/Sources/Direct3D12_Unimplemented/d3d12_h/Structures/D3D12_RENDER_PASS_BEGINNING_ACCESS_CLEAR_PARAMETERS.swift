/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct RenderPassBeginningAccessClearParameters {
    internal var rawValue: WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS


    internal init(_ rawValue: WinSDK.D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RenderPassBeginningAccessClearParameters")
public typealias D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS = RenderPassBeginningAccessClearParameters

#endif
