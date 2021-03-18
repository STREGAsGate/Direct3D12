/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct IndexBufferView {
    internal var rawValue: WinSDK.D3D12_INDEX_BUFFER_VIEW


    internal init(_ rawValue: WinSDK.D3D12_INDEX_BUFFER_VIEW) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "IndexBufferView")
public typealias D3D12_INDEX_BUFFER_VIEW = IndexBufferView

#endif
