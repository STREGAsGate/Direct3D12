/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Describes the footprint of a placed subresource, including the offset and the D3D12_SUBRESOURCE_FOOTPRINT.
public struct D3DPlacedSubresourceFootprint {
    public typealias RawValue = WinSDK.D3D12_PLACED_SUBRESOURCE_FOOTPRINT
    internal var rawValue: RawValue

    /// The offset of the subresource within the parent resource, in bytes. The offset between the start of the parent resource and this subresource.
    public var offset: UInt64 {
        get {
            return rawValue.Offset
        }
        set {
            rawValue.Offset = newValue
        }
    }

    /// The format, width, height, depth, and row-pitch of the subresource, as a D3D12_SUBRESOURCE_FOOTPRINT structure.
    public var footprint: D3DSubresourceFootprint {
        get {
            return D3DSubresourceFootprint(rawValue.Footprint)
        }
        set {
            rawValue.Footprint = newValue.rawValue
        }
    }

    /** Describes the footprint of a placed subresource, including the offset and the D3D12_SUBRESOURCE_FOOTPRINT.
    - parameter offset: The offset of the subresource within the parent resource, in bytes. The offset between the start of the parent resource and this subresource.
    - parameter footprint: The format, width, height, depth, and row-pitch of the subresource, as a D3D12_SUBRESOURCE_FOOTPRINT structure.
    */
    public init(offset: UInt64, footprint: D3DSubresourceFootprint) {
        self.rawValue = RawValue()
        self.offset = offset
        self.footprint = footprint
    }

    /// Describes the footprint of a placed subresource, including the offset and the D3D12_SUBRESOURCE_FOOTPRINT.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DPlacedSubresourceFootprint")
public typealias D3D12_PLACED_SUBRESOURCE_FOOTPRINT = D3DPlacedSubresourceFootprint

#endif
