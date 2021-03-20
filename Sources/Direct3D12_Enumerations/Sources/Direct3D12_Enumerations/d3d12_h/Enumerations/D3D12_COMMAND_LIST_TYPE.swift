/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies the type of a command list.
public enum CommandListType {
    ///	Specifies a command buffer that the GPU can execute. A direct command list doesn't inherit any GPU state.
    case direct
    ///	Specifies a command buffer that can be executed only directly via a direct command list. A bundle command list inherits all GPU state (except for the currently set pipeline state object and primitive topology).
    case bundle
    ///	Specifies a command buffer for computing.
    case compute
    ///	Specifies a command buffer for copying.
    case copy
    ///	Specifies a command buffer for video decoding.
    case videoDecode
    ///	Specifies a command buffer for video processing.
    case videoProcess
    ///	Specifies a command buffer for video encoding.
    case videoEncode
    /// This only occurse if there was no implementation for the wrapped rawValue.
    /// This can happen if d3d12 is expanded but this Swift package is not yet updated.
    case _unimplemented(RawValue)
}

extension CommandListType: RawRepresentable {
    public typealias RawValue = WinSDK.D3D12_COMMAND_LIST_TYPE
    public var rawValue: WinSDK.D3D12_COMMAND_LIST_TYPE {
        switch self {
        case .direct:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_DIRECT
        case .bundle:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_BUNDLE
        case .compute:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_COMPUTE
        case .copy:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_COPY
        case .videoDecode:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE
        case .videoProcess:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS
        case .videoEncode:
            return WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE
        case let ._unimplemented(rawValue):
            return rawValue
        }
    }
    public init(rawValue: RawValue) {
        switch rawValue {
        case WinSDK.D3D12_COMMAND_LIST_TYPE_DIRECT:
            self = .direct
        case WinSDK.D3D12_COMMAND_LIST_TYPE_BUNDLE:
            self = .bundle
        case WinSDK.D3D12_COMMAND_LIST_TYPE_COMPUTE:
            self = .compute
        case WinSDK.D3D12_COMMAND_LIST_TYPE_COPY:
            self = .copy
        case WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE:
            self = .videoDecode
        case WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS:
            self = .videoProcess
        case WinSDK.D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE:
            self = .videoEncode
        default:
            self = ._unimplemented(rawValue)
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CommandListType")
public typealias D3D12_COMMAND_LIST_TYPE = CommandListType


@available(*, deprecated, renamed: "CommandListType.direct")
public let D3D12_COMMAND_LIST_TYPE_DIRECT = CommandListType.direct

@available(*, deprecated, renamed: "CommandListType.bundle")
public let D3D12_COMMAND_LIST_TYPE_BUNDLE = CommandListType.bundle

@available(*, deprecated, renamed: "CommandListType.compute")
public let D3D12_COMMAND_LIST_TYPE_COMPUTE = CommandListType.compute

@available(*, deprecated, renamed: "CommandListType.copy")
public let D3D12_COMMAND_LIST_TYPE_COPY = CommandListType.copy

@available(*, deprecated, renamed: "CommandListType.videoDecode")
public let D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE = CommandListType.videoDecode

@available(*, deprecated, renamed: "CommandListType.videoProcess")
public let D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS = CommandListType.videoProcess

@available(*, deprecated, renamed: "CommandListType.videoEncode")
public let D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE = CommandListType.videoEncode

#endif
