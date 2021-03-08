/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Identifies how to view a buffer resource.
public struct BufferSrvFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates a default view.
    //static let none = BufferSrvFlags(rawValue: D3D12_BUFFER_SRV_FLAG_NONE.rawValue)

    ///	View the buffer as raw. For more info about raw viewing of buffers, see [Raw Views of Buffers](https://docs.microsoft.com/en-us/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro).
    static let raw = BufferSrvFlags(rawValue: WinSDK.D3D12_BUFFER_SRV_FLAG_RAW.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BufferSrvFlags")
public typealias D3D12_BUFFER_SRV_FLAG = BufferSrvFlags

public extension BufferSrvFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_BUFFER_SRV_FLAG_NONE: BufferSrvFlags = []

    @available(*, deprecated, renamed: "raw")
    static let D3D12_BUFFER_SRV_FLAG_RAW = Self.raw
}

#endif
