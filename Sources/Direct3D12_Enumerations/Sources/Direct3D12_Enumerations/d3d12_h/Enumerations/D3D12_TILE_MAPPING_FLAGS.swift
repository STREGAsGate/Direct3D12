/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Specifies how to perform a tile-mapping operation.
public struct TileMappingFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_TILE_MAPPING_FLAGS
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No tile-mapping flags are specified.
    //static let none = TileMappingFlags(rawValue: WinSDK.D3D12_TILE_MAPPING_FLAG_NONE.rawValue)

    /// Unsupported, do not use.
    @available(*, unavailable, message: "Unsupported, do not use.")
    static let noHazard = TileMappingFlags(rawValue: WinSDK.D3D12_TILE_MAPPING_FLAG_NO_HAZARD.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TileMappingFlags")
public typealias D3D12_TILE_MAPPING_FLAGS = TileMappingFlags

public extension TileMappingFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_TILE_MAPPING_FLAG_NONE: TileMappingFlags = []

    @available(*, deprecated, renamed: "noHazard")
    static let D3D12_TILE_MAPPING_FLAG_NO_HAZARD = TileMappingFlags(rawValue: WinSDK.D3D12_TILE_MAPPING_FLAG_NO_HAZARD.rawValue)
}

#endif
