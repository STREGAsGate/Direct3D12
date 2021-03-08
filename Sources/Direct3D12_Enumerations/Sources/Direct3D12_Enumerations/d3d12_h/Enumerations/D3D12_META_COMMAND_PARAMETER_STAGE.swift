/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Defines constants that specify the stage of a parameter to a meta command.
public enum MetaCommandParameterStage {
///	Specifies that the parameter is used at the meta command creation stage.
case creation
///	Specifies that the parameter is used at the meta command initialization stage.
case initialization
///	Specifies that the parameter is used at the meta command execution stage.
case execution

    internal var rawValue: WinSDK.D3D12_META_COMMAND_PARAMETER_STAGE {
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

@available(*, deprecated, renamed: "MetaCommandParameterStage")
public typealias D3D12_META_COMMAND_PARAMETER_STAGE = MetaCommandParameterStage

public extension MetaCommandParameterStage  {
    @available(*, deprecated, renamed: "creation")
    static let D3D12_META_COMMAND_PARAMETER_STAGE_CREATION = Self.creation

    @available(*, deprecated, renamed: "initialization")
    static let D3D12_META_COMMAND_PARAMETER_STAGE_INITIALIZATION = Self.initialization

    @available(*, deprecated, renamed: "execution")
    static let D3D12_META_COMMAND_PARAMETER_STAGE_EXECUTION = Self.execution
}

#endif
