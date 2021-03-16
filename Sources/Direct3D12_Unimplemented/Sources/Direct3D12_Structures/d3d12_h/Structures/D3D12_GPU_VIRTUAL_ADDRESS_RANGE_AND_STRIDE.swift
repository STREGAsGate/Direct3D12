/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct GpuVirtualAddressRangeAndStride {
    internal var rawValue: WinSDK.D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE


    internal init(_ rawValue: WinSDK.D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GpuVirtualAddressRangeAndStride")
public typealias D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE = GpuVirtualAddressRangeAndStride

#endif
