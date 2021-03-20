/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a type of descriptor heap.
public enum DescriptorHeapType {
    public typealias RawValue = WinSDK.D3D12_DESCRIPTOR_HEAP_TYPE
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

    public var rawValue: RawValue {
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


@available(*, deprecated, renamed: "DescriptorHeapType.constantBufferShaderResourceAndUnordererAccess")
public let D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV = DescriptorHeapType.constantBufferShaderResourceAndUnordererAccess

@available(*, deprecated, renamed: "DescriptorHeapType.sampler")
public let D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER = DescriptorHeapType.sampler

@available(*, deprecated, renamed: "DescriptorHeapType.renderTargetView")
public let D3D12_DESCRIPTOR_HEAP_TYPE_RTV = DescriptorHeapType.renderTargetView

@available(*, deprecated, renamed: "DescriptorHeapType.depthStencilView")
public let D3D12_DESCRIPTOR_HEAP_TYPE_DSV = DescriptorHeapType.depthStencilView

@available(*, deprecated, renamed: "DescriptorHeapType.numberOfTypes")
public let D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES = DescriptorHeapType.numberOfTypes

#endif
