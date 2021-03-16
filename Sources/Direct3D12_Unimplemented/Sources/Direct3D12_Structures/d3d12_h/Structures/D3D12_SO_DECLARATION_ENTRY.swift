/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct StreamOutputDeclarationEntry {
    internal var rawValue: WinSDK.D3D12_SO_DECLARATION_ENTRY


    internal init(_ rawValue: WinSDK.D3D12_SO_DECLARATION_ENTRY) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StreamOutputDeclarationEntry")
public typealias D3D12_SO_DECLARATION_ENTRY = RenderTargetFormatArray

#endif