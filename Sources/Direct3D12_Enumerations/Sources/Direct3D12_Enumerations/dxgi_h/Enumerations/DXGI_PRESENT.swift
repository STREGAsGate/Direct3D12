/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// The DXGI_PRESENT constants specify options for presenting frames to the output.
public struct DGIPresentFlags: OptionSet {
    public typealias RawValue = UInt32
    public let rawValue: RawValue

    /// Present a frame from the current buffer to the output. Use this flag so that the presentation can use vertical-blank synchronization instead of sequencing buffers in the chain in the usual manner.
    static let noSequence = DGIPresentFlags(rawValue: WinSDK.DXGI_PRESENT_DO_NOT_SEQUENCE)

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DGIPresentFlags.noSequence")
public let DXGI_PRESENT_DO_NOT_SEQUENCE = DGIPresentFlags.noSequence

#endif
