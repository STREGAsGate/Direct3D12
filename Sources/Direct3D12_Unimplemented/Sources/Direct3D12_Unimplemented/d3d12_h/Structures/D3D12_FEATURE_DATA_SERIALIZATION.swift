/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct FeatureDataSerialization {
    internal var rawValue: WinSDK.D3D12_FEATURE_DATA_SERIALIZATION


    internal init(_ rawValue: WinSDK.D3D12_FEATURE_DATA_SERIALIZATION) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FeatureDataSerialization")
public typealias D3D12_FEATURE_DATA_SERIALIZATION = FeatureDataSerialization

#endif
