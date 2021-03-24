/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

public typealias D3DGPUVirtualAddress = WinSDK.D3D12_GPU_VIRTUAL_ADDRESS

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DGPUVirtualAddress")
public typealias D3D12_GPU_VIRTUAL_ADDRESS = D3DGPUVirtualAddress

#endif