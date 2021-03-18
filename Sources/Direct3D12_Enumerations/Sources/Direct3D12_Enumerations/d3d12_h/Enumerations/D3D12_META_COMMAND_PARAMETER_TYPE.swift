/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the data type of a parameter to a meta command.
public enum MetaCommandParameterType {
    ///	Specifies that the parameter is of type FLOAT.
    case float
    ///	Specifies that the parameter is of type UINT64.
    case uint64
    ///	Specifies that the parameter is a GPU virtual address.
    case gpuVirtualAddress
    ///	Specifies that the parameter is a CPU descriptor handle to a heap containing either constant buffer views, shader resource views, or unordered access views.
    case cpuDescriptoHeapHandle
    ///	Specifies that the parameter is a GPU descriptor handle to a heap containing either constant buffer views, shader resource views, or unordered access views.
    case gpuDescriptorHeapHandle

    internal var rawValue: WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE {
        switch self {
        case .float:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE_FLOAT
        case .uint64:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE_UINT64
        case .gpuVirtualAddress:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE_GPU_VIRTUAL_ADDRESS
        case .cpuDescriptoHeapHandle:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE_CPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV
        case .gpuDescriptorHeapHandle:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_TYPE_GPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "MetaCommandParameterType")
public typealias D3D12_META_COMMAND_PARAMETER_TYPE = MetaCommandParameterType

public extension MetaCommandParameterType  {
    @available(*, deprecated, renamed: "float")
    static let D3D12_META_COMMAND_PARAMETER_TYPE_FLOAT = Self.float

    @available(*, deprecated, renamed: "uint64")
    static let D3D12_META_COMMAND_PARAMETER_TYPE_UINT64 = Self.uint64

    @available(*, deprecated, renamed: "gpuVirtualAddress")
    static let D3D12_META_COMMAND_PARAMETER_TYPE_GPU_VIRTUAL_ADDRESS = Self.gpuVirtualAddress

    @available(*, deprecated, renamed: "cpuDescriptoHeapHandle")
    static let D3D12_META_COMMAND_PARAMETER_TYPE_CPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV = Self.cpuDescriptoHeapHandle

    @available(*, deprecated, renamed: "gpuDescriptorHeapHandle")
    static let D3D12_META_COMMAND_PARAMETER_TYPE_GPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV = Self.gpuDescriptorHeapHandle
}

#endif
