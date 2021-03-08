/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

public struct RaytracingInstanceDescription {
    internal var rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_DESC


    internal init(_ rawValue: WinSDK.D3D12_RAYTRACING_INSTANCE_DESC) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "RaytracingInstanceDescription")
public typealias D3D12_RAYTRACING_INSTANCE_DESC = RaytracingInstanceDescription

#endif
