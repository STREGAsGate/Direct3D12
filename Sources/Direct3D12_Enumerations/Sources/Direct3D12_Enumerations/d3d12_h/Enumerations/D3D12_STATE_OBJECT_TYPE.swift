/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of a state object. Use with D3D12_STATE_OBJECT_DESC.
public enum StateObjectType {
    ///	Collection state object.
    case collection
    ///	Raytracing pipeline state object.
    case raytracingPipeline

    internal var rawValue: WinSDK.D3D12_STATE_OBJECT_TYPE {
        switch self {
        case .collection:
            return WinSDK.D3D12_STATE_OBJECT_TYPE_COLLECTION
        case .raytracingPipeline:
            return WinSDK.D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "StateObjectType")
public typealias D3D12_STATE_OBJECT_TYPE = StateObjectType

public extension StateObjectType  {
    @available(*, deprecated, renamed: "collection")
    static let D3D12_STATE_OBJECT_TYPE_COLLECTION = Self.collection

    @available(*, deprecated, renamed: "raytracingPipeline")
    static let D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE = Self.raytracingPipeline
}

#endif
