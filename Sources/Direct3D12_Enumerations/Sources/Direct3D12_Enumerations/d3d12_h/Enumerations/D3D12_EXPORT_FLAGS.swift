/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// The flags to apply when exporting symbols from a state subobject.
public struct ExportFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No export flags.
    //static let none = DepthStencilViewFlags(rawValue: WinSDK.D3D12_EXPORT_FLAG_NONE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ExportFlags")
public typealias D3D12_EXPORT_FLAGS = ExportFlags

public extension ExportFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_EXPORT_FLAG_NONE: ExportFlags = []
}

#endif
