/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies the type of filter reduction.
public enum FilterReductionType {
    ///	The filter type is standard.
    case standard
    ///	The filter type is comparison.
    case comparison
    ///	The filter type is minimum.
    case minimum
    ///	The filter type is maximum.
    case maximum

    internal var rawValue: WinSDK.D3D12_FILTER_REDUCTION_TYPE {
        switch self {
        case .standard:
            return WinSDK.D3D12_FILTER_REDUCTION_TYPE_STANDARD
        case .comparison:
            return WinSDK.D3D12_FILTER_REDUCTION_TYPE_COMPARISON
        case .minimum:
            return WinSDK.D3D12_FILTER_REDUCTION_TYPE_MINIMUM
        case .maximum:
            return WinSDK.D3D12_FILTER_REDUCTION_TYPE_MAXIMUM
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FilterReductionType")
public typealias D3D12_FILTER_REDUCTION_TYPE = FilterReductionType

public extension FilterReductionType  {
    @available(*, deprecated, renamed: "standard")
    static let D3D12_FILTER_REDUCTION_TYPE_STANDARD = Self.standard
    
    @available(*, deprecated, renamed: "comparison")
    static let D3D12_FILTER_REDUCTION_TYPE_COMPARISON = Self.comparison
    
    @available(*, deprecated, renamed: "minimum")
    static let D3D12_FILTER_REDUCTION_TYPE_MINIMUM = Self.minimum
     
    @available(*, deprecated, renamed: "maximum")
    static let D3D12_FILTER_REDUCTION_TYPE_MAXIMUM = Self.maximum
}

#endif
