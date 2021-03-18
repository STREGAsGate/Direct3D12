/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct FeatureDataD3d12Options2 {
    internal var rawValue: WinSDK.D3D12_FEATURE_DATA_D3D12_OPTIONS2


    internal init(_ rawValue: WinSDK.D3D12_FEATURE_DATA_D3D12_OPTIONS2) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FeatureDataD3d12Options2")
public typealias D3D12_FEATURE_DATAWinSDK_OPTIONS2 = FeatureDataD3d12Options2

#endif
