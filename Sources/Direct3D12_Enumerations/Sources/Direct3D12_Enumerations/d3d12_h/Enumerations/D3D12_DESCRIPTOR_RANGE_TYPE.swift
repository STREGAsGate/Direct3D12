/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a type of descriptor heap.
public enum DescriptorRangeType {
    ///	Specifies a range of SRVs.
    //TODO: Figure out what srv stands for
    case srv
    ///	Specifies a range of unordered-access views (UAVs).
    case unorderedAccessView
    ///	Specifies a range of constant-buffer views (CBVs).
    case constantBufferView
    ///	Specifies a range of samplers.
    case sampler

    internal var rawValue: WinSDK.D3D12_DESCRIPTOR_RANGE_TYPE {
        switch self {
        case .srv:
            return WinSDK.D3D12_DESCRIPTOR_RANGE_TYPE_SRV
        case .unorderedAccessView:
            return WinSDK.D3D12_DESCRIPTOR_RANGE_TYPE_UAV
        case .constantBufferView:
            return WinSDK.D3D12_DESCRIPTOR_RANGE_TYPE_CBV
        case .sampler:
            return WinSDK.D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DescriptorRangeType")
public typealias D3D12_DESCRIPTOR_RANGE_TYPE  = DescriptorRangeType

public extension DescriptorRangeType {
    @available(*, deprecated, renamed: "srv")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_SRV = Self.srv

    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_UAV = Self.unorderedAccessView

    @available(*, deprecated, renamed: "constantBufferView")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_CBV = Self.constantBufferView

    @available(*, deprecated, renamed: "sampler")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER = Self.sampler
}

#endif
