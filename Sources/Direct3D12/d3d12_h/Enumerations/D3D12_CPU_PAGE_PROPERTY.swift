/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies the CPU-page properties for the heap.
public enum CpuPageProperty {
    ///	The CPU-page property is unknown.
    case unknown
    ///	The CPU cannot access the heap, therefore no page properties are available.
    case notAvailable
    ///	The CPU-page property is write-combined.
    case writeCombine
    ///	The CPU-page property is write-back.
    case writeBack

    internal var rawValue: _d3d12.D3D12_CPU_PAGE_PROPERTY {
        switch self {
        case .unknown:
            return _d3d12.D3D12_CPU_PAGE_PROPERTY_UNKNOWN
        case .notAvailable:
            return _d3d12.D3D12_CPU_PAGE_PROPERTY_NOT_AVAILABLE
        case .writeCombine:
            return _d3d12.D3D12_CPU_PAGE_PROPERTY_WRITE_COMBINE
        case .writeBack:
            return _d3d12.D3D12_CPU_PAGE_PROPERTY_WRITE_BACK
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "CpuPageProperty")
public typealias D3D12_CPU_PAGE_PROPERTY = CpuPageProperty

public extension CpuPageProperty  {
    @available(*, deprecated, renamed: "unknown")
    static let D3D12_CPU_PAGE_PROPERTY_UNKNOWN = Self.unknown

    @available(*, deprecated, renamed: "notAvailable")
    static let D3D12_CPU_PAGE_PROPERTY_NOT_AVAILABLE = Self.notAvailable

    @available(*, deprecated, renamed: "writeCombine")
    static let D3D12_CPU_PAGE_PROPERTY_WRITE_COMBINE = Self.writeCombine

    @available(*, deprecated, renamed: "writeBack")
    static let D3D12_CPU_PAGE_PROPERTY_WRITE_BACK = Self.writeBack
}
