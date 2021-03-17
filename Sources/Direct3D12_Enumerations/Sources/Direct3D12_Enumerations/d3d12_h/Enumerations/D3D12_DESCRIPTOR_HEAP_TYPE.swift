/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a type of descriptor heap.
public enum DescriptorHeapType {
    ///	The descriptor heap for the combination of constant-buffer, shader-resource, and unordered-access views.
    case constantBufferShaderResourceAndUnordererAccess
    ///	The descriptor heap for the sampler.
    case sampler
    ///	The descriptor heap for the render-target view.
    case renderTargetView
    ///	The descriptor heap for the depth-stencil view.
    case depthStencilView
    ///	The number of types of descriptor heaps.
    case numberOfTypes

    public var rawValue: WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE {
        switch self {
        case .constantBufferShaderResourceAndUnordererAccess:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV
        case .sampler:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER
        case .renderTargetView:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_RTV
        case .depthStencilView:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_DSV
        case .numberOfTypes:
            return WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DescriptorHeapType")
public typealias D3D12_DESCRIPTOR_HEAP_TYPE = DescriptorHeapType

public extension DescriptorHeapType {
    @available(*, deprecated, renamed: "constantBufferShaderResourceAndUnordererAccess")
    static let D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV = Self.constantBufferShaderResourceAndUnordererAccess

    @available(*, deprecated, renamed: "sampler")
    static let D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER = Self.sampler

    @available(*, deprecated, renamed: "renderTargetView")
    static let D3D12_DESCRIPTOR_HEAP_TYPE_RTV = Self.renderTargetView

    @available(*, deprecated, renamed: "depthStencilView")
    static let D3D12_DESCRIPTOR_HEAP_TYPE_DSV = Self.depthStencilView
 
    @available(*, deprecated, renamed: "numberOfTypes")
    static let D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES = Self.numberOfTypes
}

#endif
