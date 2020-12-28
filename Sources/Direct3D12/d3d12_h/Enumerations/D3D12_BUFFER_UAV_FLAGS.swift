/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Identifies unordered-access view options for a buffer resource.
public struct BufferUavFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates a default view.
    //static let none = BufferUavFlags(rawValue: D3D12_BUFFER_UAV_FLAG_NONE.rawValue)

    /// Resource contains raw, unstructured data. Requires the UAV format to be [DXGI_FORMAT_R32_TYPELESS](https://docs.microsoft.com/en-us/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format).
    /// For more info about raw viewing of buffers, see [Raw Views of Buffers](https://docs.microsoft.com/en-us/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro).
    static let raw = BufferUavFlags(rawValue: _d3d12.D3D12_BUFFER_UAV_FLAG_RAW.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BufferUavFlags")
public typealias D3D12_BUFFER_UAV_FLAG = BufferUavFlags

public extension BufferUavFlags {
    @available(*, deprecated, message: "Use `[]` to represent none in Swift.")
    static let D3D12_BUFFER_UAV_FLAG_NONE: BufferUavFlags = []

    @available(*, deprecated, renamed: "raw")
    static let D3D12_BUFFER_UAV_FLAG_RAW = Self.raw
}

#endif
