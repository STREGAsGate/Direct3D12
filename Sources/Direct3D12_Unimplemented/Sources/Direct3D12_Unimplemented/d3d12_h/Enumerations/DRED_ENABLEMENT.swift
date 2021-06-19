/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants (used by the [ID3D12DeviceRemovedExtendedDataSettings interface](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings)) that specify how individual Device Removed Extended Data (DRED) features are enabled. As of DRED version 1.1, the default value for all settings is D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED.
@available(Windows, introduced: 10.0.18362)
public enum DREDEnablement {
    public typealias RawValue = WinSDK.D3D12_DRED_ENABLEMENT
    ///	Specifies that a DRED feature is enabled only when DRED is turned on by the system automatically (for example, when a user is reproducing a problem via FeedbackHub).
    case systemControlled
    ///	Specifies that a DRED feature should be force-disabled, regardless of the system state.
    case forcedOff
    ///	Specifies that a DRED feature should be force-enabled, regardless of the system state.
    case forcedOn

    public var rawValue: RawValue {
        switch self {
        case .systemControlled:
            return WinSDK.D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED
        case .forcedOff:
            return WinSDK.D3D12_DRED_ENABLEMENT_FORCED_OFF
        case .forcedOn:
            return WinSDK.D3D12_DRED_ENABLEMENT_FORCED_ON
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "DREDEnablement")
public typealias D3D12_DRED_ENABLEMENT = DREDEnablement

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "systemControlled")
public let D3D12_DRED_ENABLEMENT_SYSTEM_CONTROLLED = DREDEnablement.systemControlled

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "forcedOff")
public let D3D12_DRED_ENABLEMENT_FORCED_OFF = DREDEnablement.forcedOff

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "forcedOn")
public let D3D12_DRED_ENABLEMENT_FORCED_ON = DREDEnablement.forcedOn


#endif
