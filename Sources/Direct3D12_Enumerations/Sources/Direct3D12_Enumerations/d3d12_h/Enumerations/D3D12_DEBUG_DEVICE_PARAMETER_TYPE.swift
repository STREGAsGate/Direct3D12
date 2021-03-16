/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the data type of the memory pointed to by the pData parameter of [ID3D12DebugDevice1::SetDebugParameter](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter) and [ID3D12DebugDevice1::GetDebugParameter](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-getdebugparameter).
public enum DebugDeviceParameterType {
    ///	Indicates pData points to a [D3D12_DEBUG_FEATURE](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature) value.
    case featureFlags
    ///	Indicates pData points to a [D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings) structure.
    case gpuBasedValidationSettings
    ///	Indicates pData points to a [D3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_slowdown_performance_factor) structure.
    case gpuSlowdownPerformanceFactor

    internal var rawValue: WinSDK.D3D12_DEBUG_DEVICE_PARAMETER_TYPE {
        switch self {
    case .featureFlags:
        return WinSDK.D3D12_DEBUG_DEVICE_PARAMETER_FEATURE_FLAGS
    case .gpuBasedValidationSettings:
        return WinSDK.D3D12_DEBUG_DEVICE_PARAMETER_GPU_BASED_VALIDATION_SETTINGS
    case .gpuSlowdownPerformanceFactor:
        return WinSDK.D3D12_DEBUG_DEVICE_PARAMETER_GPU_SLOWDOWN_PERFORMANCE_FACTOR
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DebugDeviceParameterType")
public typealias D3D12_DEBUG_DEVICE_PARAMETER_TYPE = DebugDeviceParameterType

public extension DebugDeviceParameterType  {
    @available(*, deprecated, renamed: "featureFlags")
    static let D3D12_DEBUG_DEVICE_PARAMETER_FEATURE_FLAGS = Self.featureFlags

    @available(*, deprecated, renamed: "gpuBasedValidationSettings")
    static let D3D12_DEBUG_DEVICE_PARAMETER_GPU_BASED_VALIDATION_SETTINGS = Self.gpuBasedValidationSettings
    
    @available(*, deprecated, renamed: "gpuSlowdownPerformanceFactor")
    static let D3D12_DEBUG_DEVICE_PARAMETER_GPU_SLOWDOWN_PERFORMANCE_FACTOR = Self.gpuSlowdownPerformanceFactor
}

#endif
