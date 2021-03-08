/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Identifies the type of data contained in an input slot.
public enum InputClassification {
    ///	Input data is per-vertex data.
    case perVertexData
    ///	Input data is per-instance data.
    case perInstanceData

    internal var rawValue: WinSDK.D3D12_INPUT_CLASSIFICATION {
        switch self {
        case .perVertexData:
            return WinSDK.D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA
        case .perInstanceData:
            return WinSDK.D3D12_INPUT_CLASSIFICATION_PER_INSTANCE_DATA
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "InputClassification")
public typealias D3D12_INPUT_CLASSIFICATION = InputClassification

public extension InputClassification  {
    @available(*, deprecated, renamed: "perVertexData")
    static let D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA = Self.perVertexData

    @available(*, deprecated, renamed: "perInstanceData")
    static let D3D12_INPUT_CLASSIFICATION_PER_INSTANCE_DATA = Self.perInstanceData
}

#endif
