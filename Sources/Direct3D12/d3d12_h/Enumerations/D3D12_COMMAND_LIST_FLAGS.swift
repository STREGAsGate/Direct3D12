/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies flags to be used when creating a command list.
public struct CommandListFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// No flags specified.
    //static let none = CommandListFlags(rawValue: _d3d12.D3D12_COMMAND_LIST_FLAG_NONE.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "CommandListFlags")
public typealias D3D12_COMMAND_LIST_FLAGS = CommandListFlags

public extension ColorWriteEnable {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_COMMAND_LIST_FLAG_NONE: CommandListFlags = []
}
