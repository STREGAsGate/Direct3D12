/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies how to copy a tile.
public struct TileCopyFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No tile-copy flags are specified.
    //static let none = TileCopyFlags(rawValue: WinSDK.D3D12_TILE_COPY_FLAG_NONE.rawValue)

    ///	Indicates that the GPU isn't currently referencing any of the
    /// portions of destination memory being written.
    static let noHazard = TileCopyFlags(rawValue: WinSDK.D3D12_TILE_COPY_FLAG_NO_HAZARD.rawValue)
    ///	Indicates that the ID3D12GraphicsCommandList::CopyTiles operation involves copying a linear buffer to a swizzled tiled resource. This means to copy tile data from the
    /// specified buffer location, reading tiles sequentially,
    /// to the specified tile region (in x,y,z order if the region is a box), swizzling to optimal hardware memory layout as needed.
    /// In this ID3D12GraphicsCommandList::CopyTiles call, you specify the source data with the pBuffer parameter and the destination with the pTiledResource parameter.
    static let linearBufferToSwizzledTiledResource = TileCopyFlags(rawValue: WinSDK.D3D12_TILE_COPY_FLAG_LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE.rawValue)
    ///	Indicates that the ID3D12GraphicsCommandList::CopyTiles operation involves copying a swizzled tiled resource to a linear buffer. This means to copy tile data from the tile region, reading tiles sequentially (in x,y,z order if the region is a box),
    /// to the specified buffer location, deswizzling to linear memory layout as needed.
    /// In this ID3D12GraphicsCommandList::CopyTiles call, you specify the source data with the pTiledResource parameter and the destination with the pBuffer parameter.
    static let swizzledTiledResourceToLinearBuffer = TileCopyFlags(rawValue: WinSDK.D3D12_TILE_COPY_FLAG_SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TileCopyFlags")
public typealias D3D12_TILE_COPY_FLAGS = TileCopyFlags

public extension TileCopyFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_TILE_COPY_FLAG_NONE: TileCopyFlags = []

    @available(*, deprecated, renamed: "noHazard")
    static let D3D12_TILE_COPY_FLAG_NO_HAZARD = Self.noHazard
    
    @available(*, deprecated, renamed: "linearBufferToSwizzledTiledResource")
    static let D3D12_TILE_COPY_FLAG_LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE = Self.linearBufferToSwizzledTiledResource
    
    @available(*, deprecated, renamed: "swizzledTiledResourceToLinearBuffer")
    static let D3D12_TILE_COPY_FLAG_SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER = Self.swizzledTiledResourceToLinearBuffer
}

#endif
