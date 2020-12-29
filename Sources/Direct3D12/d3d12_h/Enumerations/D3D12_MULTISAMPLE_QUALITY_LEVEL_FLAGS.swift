/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies options for determining quality levels.
public struct MultisampleQualityLevelFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No options are supported.
    //static let none = MultisampleQualityLevelFlags(rawValue: _d3d12.D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_NONE.rawValue)

    /// The number of quality levels can be determined for tiled resources.
    static let tiledResource = MultisampleQualityLevelFlags(rawValue: _d3d12.D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_TILED_RESOURCE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "MultisampleQualityLevelFlags")
public typealias D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS = MultisampleQualityLevelFlags

public extension MultisampleQualityLevelFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_NONE: MultisampleQualityLevelFlags = []

    @available(*, deprecated, renamed: "tiledResource")
    static let D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_TILED_RESOURCE = Self.tiledResource
}

#endif
