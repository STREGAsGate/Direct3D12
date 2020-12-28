/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants (used by the [ID3D12DeviceRemovedExtendedDataSettings interface](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings)) that specify how individual Device Removed Extended Data (DRED) features are enabled. As of DRED version 1.1, the default value for all settings is D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED.
public enum DredEnablement {
    ///	Specifies that a DRED feature is enabled only when DRED is turned on by the system automatically (for example, when a user is reproducing a problem via FeedbackHub).
    case systemControlled
    ///	Specifies that a DRED feature should be force-disabled, regardless of the system state.
    case forcedOff
    ///	Specifies that a DRED feature should be force-enabled, regardless of the system state.
    case forcedOn

    internal var rawValue: _d3d12.D3D12_DRED_ENABLEMENT {
        switch self {
        case .systemControlled:
            return _d3d12.D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED
        case .forcedOff:
            return _d3d12.D3D12_DRED_ENABLEMENT_FORCED_OFF
        case .forcedOn:
            return _d3d12.D3D12_DRED_ENABLEMENT_FORCED_ON
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DredEnablement")
public typealias D3D12_DRED_ENABLEMENT = DredEnablement

public extension DredEnablement {
    @available(*, deprecated, renamed: "systemControlled")
    static let D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED = Self.systemControlled

    @available(*, deprecated, renamed: "forcedOff")
    static let D3D12_DRED_ENABLEMENT_FORCED_OFF = Self.forcedOff

    @available(*, deprecated, renamed: "forcedOn")
    static let D3D12_DRED_ENABLEMENT_FORCED_ON = Self.forcedOn
}

#endif
