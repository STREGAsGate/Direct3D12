/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify the flags for a parameter to a meta command. Values can be bitwise OR'd together.
public struct MetaCommandParameterFlags: OptionSet {
    public let rawValue: Int32

    ///	Specifies that the parameter is an input resource.
    static let input = MetaCommandParameterFlags(rawValue: _d3d12.D3D12_META_COMMAND_PARAMETER_FLAG_INPUT.rawValue)
    ///	Specifies that the parameter is an output resource.
    static let output = MetaCommandParameterFlags(rawValue: _d3d12.D3D12_META_COMMAND_PARAMETER_FLAG_OUTPUT.rawValue)
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "MetaCommandParameterFlags")
public typealias D3D12_META_COMMAND_PARAMETER_FLAGS = MetaCommandParameterFlags

public extension MetaCommandParameterFlags {
    @available(*, deprecated, renamed: "input")
    static let D3D12_META_COMMAND_PARAMETER_FLAG_INPUT = Self.input

    @available(*, deprecated, renamed: "output")
    static let D3D12_META_COMMAND_PARAMETER_FLAG_OUTPUT = Self.output
}

#endif
