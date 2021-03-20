/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify the stage of a parameter to a meta command.
@available(Windows, introduced: 10.0.17763)
public enum MetaCommandParameterStage {
    public typealias RawValue = WinSDK.D3D12_META_COMMAND_PARAMETER_STAGE
    ///	Specifies that the parameter is used at the meta command creation stage.
    case creation
    ///	Specifies that the parameter is used at the meta command initialization stage.
    case initialization
    ///	Specifies that the parameter is used at the meta command execution stage.
    case execution

    public var rawValue: RawValue {
        switch self {
        case .creation:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_STAGE_CREATION
        case .initialization:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_STAGE_INITIALIZATION
        case .execution:
            return WinSDK.D3D12_META_COMMAND_PARAMETER_STAGE_EXECUTION
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "MetaCommandParameterStage")
public typealias D3D12_META_COMMAND_PARAMETER_STAGE = MetaCommandParameterStage

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "creation")
let D3D12_META_COMMAND_PARAMETER_STAGE_CREATION = MetaCommandParameterStage.creation

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "initialization")
let D3D12_META_COMMAND_PARAMETER_STAGE_INITIALIZATION = MetaCommandParameterStage.initialization

@available(Windows, introduced: 10.0.17763)
@available(*, deprecated, renamed: "execution")
let D3D12_META_COMMAND_PARAMETER_STAGE_EXECUTION = MetaCommandParameterStage.execution


#endif
