/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

public struct RootDescriptorTable1 {
    internal var rawValue: _d3d12.D3D12_ROOT_DESCRIPTOR_TABLE1


    internal init(_ rawValue: _d3d12.D3D12_ROOT_DESCRIPTOR_TABLE1) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RootDescriptorTable1")
public typealias D3D12_ROOT_DESCRIPTOR_TABLE1 = RootDescriptorTable1

#endif
