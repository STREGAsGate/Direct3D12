/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public struct D3DRaytracingGeometryDescription {
    public typealias RawValue = WinSDK.D3D12_RAYTRACING_GEOMETRY_DESC
    internal var rawValue: RawValue


    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DRaytracingGeometryDescription")
public typealias D3D12_RAYTRACING_GEOMETRY_DESC = D3DRaytracingGeometryDescription

#endif
