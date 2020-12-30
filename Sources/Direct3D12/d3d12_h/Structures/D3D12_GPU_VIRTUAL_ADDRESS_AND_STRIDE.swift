/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

public struct GpuVirtualAddressAndStride {
    internal var rawValue: _d3d12.D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE


    internal init(_ rawValue: _d3d12.D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "GpuVirtualAddressAndStride")
public typealias D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE = GpuVirtualAddressAndStride

#endif
