/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies flags to be used when creating a command list.
@available(Windows, introduced: 10.0.17134)
public struct CommandListFlags: OptionSet {
    public typealias RawType = WinSDK.D3D12_COMMAND_LIST_FLAGS
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// No flags specified.
    //public static let none = CommandListFlags(rawValue: WinSDK.D3D12_COMMAND_LIST_FLAG_NONE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17134)
@available(*, deprecated, renamed: "CommandListFlags")
public typealias D3D12_COMMAND_LIST_FLAGS = CommandListFlags

@available(Windows, introduced: 10.0.17134)
public extension CommandListFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_COMMAND_LIST_FLAG_NONE: CommandListFlags = []
}

#endif
