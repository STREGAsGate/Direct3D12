/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct TiledResourceCoordinate {
    public typealias RawValue = WinSDK.D3D12_TILED_RESOURCE_COORDINATE
    var rawValue: RawValue


    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TiledResourceCoordinate")
public typealias D3D12_TILED_RESOURCE_COORDINATE = TiledResourceCoordinate

#endif