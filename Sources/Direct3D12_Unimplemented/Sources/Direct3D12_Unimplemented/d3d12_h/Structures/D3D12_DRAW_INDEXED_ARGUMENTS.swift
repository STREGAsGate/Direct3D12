/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct DrawIndexedArguments {
    internal var rawValue: WinSDK.D3D12_DRAW_INDEXED_ARGUMENTS


    internal init(_ rawValue: WinSDK.D3D12_DRAW_INDEXED_ARGUMENTS) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DrawIndexedArguments")
public typealias D3D12_DRAW_INDEXED_ARGUMENTS = DrawIndexedArguments

#endif
