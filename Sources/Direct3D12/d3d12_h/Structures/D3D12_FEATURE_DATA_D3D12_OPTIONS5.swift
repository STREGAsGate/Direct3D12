/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

public struct FeatureDataD3d12Options5 {
    internal var rawValue: _d3d12.D3D12_FEATURE_DATA_D3D12_OPTIONS5


    internal init(_ rawValue: _d3d12.D3D12_FEATURE_DATA_D3D12_OPTIONS5) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FeatureDataD3d12Options5")
public typealias D3D12_FEATURE_DATA_D3D12_OPTIONS5 = FeatureDataD3d12Options5

#endif
