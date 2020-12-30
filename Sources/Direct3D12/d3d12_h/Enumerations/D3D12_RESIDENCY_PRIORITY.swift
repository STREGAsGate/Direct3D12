/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies broad residency priority buckets useful for quickly establishing an application priority scheme.
/// Applications can assign priority values other than the five values present in this enumeration.
public enum ResidencyPriority {
    ///	Indicates a minimum priority.
    case minimum
    ///	Indicates a low priority.
    case low
    ///	Indicates a normal, medium, priority.
    case normal
    ///	Indicates a high priority. Applications are discouraged from using priories greater than this. For more information see ID3D12Device1::SetResidencyPriority.
    case high
    ///	Indicates a maximum priority. Applications are discouraged from using priorities greater than this; D3D12_RESIDENCY_PRIORITY_MAXIMUM is not guaranteed to be available. For more information see ID3D12Device1::SetResidencyPriority
    case maximum

    internal var rawValue: _d3d12.D3D12_RESIDENCY_PRIORITY {
        switch self {
        case .minimum:
            return _d3d12.D3D12_RESIDENCY_PRIORITY_MINIMUM
        case .low:
            return _d3d12.D3D12_RESIDENCY_PRIORITY_LOW
        case .normal:
            return _d3d12.D3D12_RESIDENCY_PRIORITY_NORMAL
        case .high:
            return _d3d12.D3D12_RESIDENCY_PRIORITY_HIGH
        case .maximum:
            return _d3d12.D3D12_RESIDENCY_PRIORITY_MAXIMUM
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ResidencyPriority")
public typealias D3D12_RESIDENCY_PRIORITY = ResidencyPriority

public extension ResidencyPriority  {
    @available(*, deprecated, renamed: "minimum")
    static let D3D12_RESIDENCY_PRIORITY_MINIMUM = Self.minimum

    @available(*, deprecated, renamed: "low")
    static let D3D12_RESIDENCY_PRIORITY_LOW = Self.low

    @available(*, deprecated, renamed: "normal")
    static let D3D12_RESIDENCY_PRIORITY_NORMAL = Self.normal

    @available(*, deprecated, renamed: "high")
    static let D3D12_RESIDENCY_PRIORITY_HIGH = Self.high

    @available(*, deprecated, renamed: "maximum")
    static let D3D12_RESIDENCY_PRIORITY_MAXIMUM = Self.maximum
}

#endif
