/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies a range of tile mappings.
public struct TileRangeFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_TILE_RANGE_FLAGS
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No tile-mapping flags are specified.
    //static let none = TileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_NONE.rawValue)

    ///	The tile range is NULL.
    static let null = TileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_NULL.rawValue)
    ///	Skip the tile range.
    static let skip = TileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_SKIP.rawValue)
    ///	Reuse a single tile in the tile range.
    static let reuseSingleTile = TileRangeFlags(rawValue: WinSDK.D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TileRangeFlags")
public typealias D3D12_TILE_RANGE_FLAGS = TileRangeFlags

public extension TileRangeFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_TILE_RANGE_FLAG_NONE: TileRangeFlags = []

    @available(*, deprecated, renamed: "null")
    static let D3D12_TILE_RANGE_FLAG_NULL = Self.null
    
    @available(*, deprecated, renamed: "skip")
    static let D3D12_TILE_RANGE_FLAG_SKIP = Self.skip
    
    @available(*, deprecated, renamed: "reuseSingleTile")
    static let D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE = Self.reuseSingleTile
}

#endif
