/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Flags to control pipeline state.
public struct PipelineStateFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates no flags.
    //static let none = PipelineStateFlags(rawValue: WinSDK.D3D12_PIPELINE_STATE_FLAG_NONE.rawValue)

    /// Indicates that the pipeline state should be compiled with additional information to assist debugging.
    /// This can only be set on WARP devices.
    static let toolDebug = PipelineStateFlags(rawValue: WinSDK.D3D12_PIPELINE_STATE_FLAG_TOOL_DEBUG.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "PipelineStateFlags")
public typealias D3D12_PIPELINE_STATE_FLAGS = PipelineStateFlags

public extension PipelineStateFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_PIPELINE_STATE_FLAG_NONE: PipelineStateFlags = []

    @available(*, deprecated, renamed: "toolDebug")
    static let D3D12_PIPELINE_STATE_FLAG_TOOL_DEBUG = Self.toolDebug
}

#endif
