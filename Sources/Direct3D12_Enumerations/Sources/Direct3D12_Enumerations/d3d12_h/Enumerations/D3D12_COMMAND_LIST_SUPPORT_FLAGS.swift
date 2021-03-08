/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Used to determine which kinds of command lists are capable of supporting various operations. For example, whether a command list supports immediate writes.
public struct CommandListSupportFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Specifies that no command list supports the operation in question.
    //static let none = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_NONE.rawValue)

    /// Specifies that direct command lists can support the operation in question.
    static let direct = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_DIRECT.rawValue)

    /// Specifies that command list bundles can support the operation in question.
    static let bundle = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_BUNDLE.rawValue)

    /// Specifies that compute command lists can support the operation in question.
    static let compute = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_COMPUTE.rawValue)

    /// Specifies that copy command lists can support the operation in question.
    static let copy = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_COPY.rawValue)

    /// Specifies that video-decode command lists can support the operation in question.
    static let videoDecode = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_DECODE.rawValue)

    /// Specifies that video-processing command lists can support the operation is question.
    static let videoProcess = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_PROCESS.rawValue)

    /// Specifies that video-encoding command lists can support the operation is question.
    static let videoEncode = CommandListSupportFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_ENCODE.rawValue)
    

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CommandListSupportFlags")
public typealias D3D12_COMMAND_LIST_SUPPORT_FLAGS = CommandListSupportFlags

public extension CommandListSupportFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_NONE: CommandListSupportFlags = []

    @available(*, deprecated, renamed: "direct")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_DIRECT = Self.direct

    @available(*, deprecated, renamed: "bundle")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_BUNDLE = Self.bundle

    @available(*, deprecated, renamed: "compute")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_COMPUTE = Self.compute

    @available(*, deprecated, renamed: "copy")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_COPY = Self.copy

    @available(*, deprecated, renamed: "videoDecode")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_DECODE = Self.videoDecode

    @available(*, deprecated, renamed: "videoProcess")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_PROCESS = Self.videoProcess

    @available(*, deprecated, renamed: "videoEncode")
    static let D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_ENCODE = Self.videoEncode
}

#endif
