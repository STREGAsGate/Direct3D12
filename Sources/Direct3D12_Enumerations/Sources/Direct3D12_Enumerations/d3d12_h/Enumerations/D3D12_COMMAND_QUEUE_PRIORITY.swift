/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines priority levels for a command queue.
public enum CommandQueuePriority {
    ///	Normal priority.
    case normal
    ///	High priority.
    case high
    ///	Global realtime priority.
    case globalRealtime

    internal var rawValue: WinSDK.D3D12_COMMAND_QUEUE_PRIORITY {
        switch self {
        case .normal:
            return WinSDK.D3D12_COMMAND_QUEUE_PRIORITY_NORMAL
        case .high:
            return WinSDK.D3D12_COMMAND_QUEUE_PRIORITY_HIGH
        case .globalRealtime:
            return WinSDK.D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "CommandQueuePriority")
public typealias D3D12_COMMAND_QUEUE_PRIORITY = CommandQueuePriority

public extension CommandQueuePriority  {
    @available(*, deprecated, renamed: "normal")
    static let D3D12_COMMAND_QUEUE_PRIORITY_NORMAL = Self.normal
  
    @available(*, deprecated, renamed: "high")
    static let D3D12_COMMAND_QUEUE_PRIORITY_HIGH = Self.high
  
    @available(*, deprecated, renamed: "globalRealtime")
    static let D3D12_COMMAND_QUEUE_PRIORITY_GLOBAL_REALTIME = Self.globalRealtime
}

#endif
