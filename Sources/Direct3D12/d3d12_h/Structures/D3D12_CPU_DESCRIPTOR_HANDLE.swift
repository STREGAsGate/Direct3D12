/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct CPUDescriptorHandle {
    internal var rawValue: WinSDK.D3D12_CPU_DESCRIPTOR_HANDLE


    internal init(_ rawValue: WinSDK.D3D12_CPU_DESCRIPTOR_HANDLE) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CPUDescriptorHandle")
public typealias D3D12_CPU_DESCRIPTOR_HANDLE = CPUDescriptorHandle 

#endif
