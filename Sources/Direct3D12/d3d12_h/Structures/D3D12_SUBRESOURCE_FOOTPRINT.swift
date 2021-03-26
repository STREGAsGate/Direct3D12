/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes the format, width, height, depth, and row-pitch of the subresource into the parent resource.
public struct D3DSubresourceFootprint {
    public typealias RawValue = WinSDK.D3D12_SUBRESOURCE_FOOTPRINT
    internal var rawValue: RawValue

    /// A DXGI_FORMAT-typed value that specifies the viewing format.
    public var format: DGIFormat {
        get {
            return DGIFormat(rawValue.Format)
        }
        set {
            rawValue.Format = newValue.rawValue
        }
    }

    /// The width of the subresource.
    public var width: UInt32 {
        get {
            return rawValue.Width
        }
        set {
            rawValue.Width = newValue
        }
    }

    /// The height of the subresource.
    public var height: UInt32 {
        get {
            return rawValue.Height
        }
        set {
            rawValue.Height = newValue
        }
    }

    /// The depth of the subresource.
    public var depth: UInt32 {
        get {
            return rawValue.Depth
        }
        set {
            rawValue.Depth = newValue
        }
    }

    /// The row pitch, or width, or physical size, in bytes, of the subresource data. This must be a multiple of D3D12_TEXTURE_DATA_PITCH_ALIGNMENT (256), and must be greater than or equal to the size of the data within a row.
    public var rowPitch: UInt32 {
        get {
            return rawValue.RowPitch
        }
        set {
            rawValue.RowPitch = newValue
        }
    }

    /** Describes the format, width, height, depth, and row-pitch of the subresource into the parent resource.
    - parameter format: A DXGI_FORMAT-typed value that specifies the viewing format.
    - parameter width: The width of the subresource.
    - parmaeter height: The height of the subresource.
    - parameter depth: The depth of the subresource.
    - parameter rowPitch: The row pitch, or width, or physical size, in bytes, of the subresource data. This must be a multiple of D3D12_TEXTURE_DATA_PITCH_ALIGNMENT (256), and must be greater than or equal to the size of the data within a row.
    */
    public init(format: DGIFormat, width: UInt32, height: UInt32, depth: UInt32, rowPitch: UInt32) {
        self.rawValue = RawValue()
        self.format = format
        self.width = width
        self.height = height
        self.depth = depth
        self.rowPitch = rowPitch
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DSubresourceFootprint")
public typealias D3D12_SUBRESOURCE_FOOTPRINT = D3DSubresourceFootprint

#endif
