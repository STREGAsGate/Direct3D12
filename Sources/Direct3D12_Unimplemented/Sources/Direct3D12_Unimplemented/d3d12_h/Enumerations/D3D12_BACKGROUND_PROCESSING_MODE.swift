/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify a level of dynamic optimization to apply to GPU work that's subsequently submitted.
@available(Windows, introduced: 10.0.18362)
public enum BackgroundProcessingMode {
    public typealias RawValue = WinSDK.D3D12_BACKGROUND_PROCESSING_MODE
	/// The default setting. Specifies that the driver may instrument workloads, and dynamically recompile shaders, in a low overhead, non-intrusive manner that avoids glitching the foreground workload.
    case allowed
    ///	Specifies that the driver may instrument as aggressively as possible. The understanding is that causing glitches is fine while in this mode, because the current work is being submitted specifically to train the system.
    case allowIntrusiveMeasurements
    ///	Specifies that background work should stop. This ensures that background shader recompilation won't consume CPU cycles. Available only in Developer mode.
    case disableBackgroundWork
    ///	Specifies that all dynamic optimization should be disabled. For example, if you're doing an A/B performance comparison, then using this constant ensures that the driver doesn't change anything that might interfere with your results. Available only in Developer mode.
    case disableProfilingBySystem
    
    public var rawValue: RawValue {
        switch self {
            case .allowed:
                return WinSDK.D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED
            case .allowIntrusiveMeasurements:
                return WinSDK.D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS
            case .disableBackgroundWork:
                return WinSDK.D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_BACKGROUND_WORK
            case .disableProfilingBySystem:
                return WinSDK.D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_PROFILING_BY_SYSTEM
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "BackgroundProcessingMode")
public typealias D3D12_BACKGROUND_PROCESSING_MODE = BackgroundProcessingMode

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "allowed")
let D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED: BackgroundProcessingMode = .allowed

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "allowIntrusiveMeasurements")
let D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS: BackgroundProcessingMode = .allowIntrusiveMeasurements

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "disableBackgroundWork")
let D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_BACKGROUND_WORK: BackgroundProcessingMode = .disableBackgroundWork

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "disableProfilingBySystem")
let D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_PROFILING_BY_SYSTEM: BackgroundProcessingMode = .disableProfilingBySystem

#endif
