/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public struct SubresourceTiling {
    internal var rawValue: WinSDK.D3D12_SUBRESOURCE_TILING


    internal init(_ rawValue: WinSDK.D3D12_SUBRESOURCE_TILING) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "SubresourceTiling")
public typealias D3D12_SUBRESOURCE_TILING = SubresourceTiling

#endif
