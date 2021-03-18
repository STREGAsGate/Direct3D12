/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct GpuVirtualAddressAndStride {
    internal var rawValue: WinSDK.D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE


    internal init(_ rawValue: WinSDK.D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GpuVirtualAddressAndStride")
public typealias D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE = GpuVirtualAddressAndStride

#endif
