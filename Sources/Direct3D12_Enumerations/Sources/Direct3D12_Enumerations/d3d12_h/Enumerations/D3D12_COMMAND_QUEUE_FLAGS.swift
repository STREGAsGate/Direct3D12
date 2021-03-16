/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Identifies unordered-access view options for a buffer resource.
public struct CommandQueueFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates a default command queue.
    //static let none = CommandQueueFlags(rawValue: D3D12_COMMAND_QUEUE_FLAG_NONE.rawValue)

    /// Indicates that the GPU timeout should be disabled for this command queue.
    static let disableGPUTimeout = CommandQueueFlags(rawValue: WinSDK.D3D12_COMMAND_QUEUE_FLAG_DISABLE_GPU_TIMEOUT.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CommandQueueFlags")
public typealias D3D12_COMMAND_QUEUE_FLAGS = CommandQueueFlags

public extension CommandQueueFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_COMMAND_QUEUE_FLAG_NONE: CommandQueueFlags = []

    @available(*, deprecated, renamed: "disableGPUTimeout")
    static let D3D12_COMMAND_QUEUE_FLAG_DISABLE_GPU_TIMEOUT = Self.disableGPUTimeout
}

#endif
