/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct TileRegionSize {
    public typealias RawValue = WinSDK.D3D12_TILE_REGION_SIZE
    var rawValue: RawValue


    init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TileRegionSize")
public typealias D3D12_TILE_REGION_SIZE = TileRegionSize

#endif