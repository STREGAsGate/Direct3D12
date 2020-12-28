/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Defines constants that specify a level of dynamic optimization to apply to GPU work that's subsequently submitted.
public enum BackgrounProcessingMode {
	/// The default setting. Specifies that the driver may instrument workloads, and dynamically recompile shaders, in a low overhead, non-intrusive manner that avoids glitching the foreground workload.
    case allowed
    ///	Specifies that the driver may instrument as aggressively as possible. The understanding is that causing glitches is fine while in this mode, because the current work is being submitted specifically to train the system.
    case allowIntrusiveMeasurements
    ///	Specifies that background work should stop. This ensures that background shader recompilation won't consume CPU cycles. Available only in Developer mode.
    case disableBackgroundWork
    ///	Specifies that all dynamic optimization should be disabled. For example, if you're doing an A/B performance comparison, then using this constant ensures that the driver doesn't change anything that might interfere with your results. Available only in Developer mode.
    case disableProfilingBySystem
    
    internal var rawValue: _d3d12.D3D12_BACKGROUND_PROCESSING_MODE {
        switch self {
            case .allowed:
                return _d3d12.D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED
            case .allowIntrusiveMeasurements:
                return _d3d12.D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS
            case .disableBackgroundWork:
                return _d3d12.D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_BACKGROUND_WORK
            case .disableProfilingBySystem:
                return _d3d12.D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_PROFILING_BY_SYSTEM
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "BackgrounProcessingMode")
public typealias D3D12_BACKGROUND_PROCESSING_MODE = BackgrounProcessingMode

public extension BackgrounProcessingMode {
    @available(*, deprecated, renamed: "allowed")
    static let D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED = Self.allowed

    @available(*, deprecated, renamed: "allowIntrusiveMeasurements")
    static let D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS = Self.allowIntrusiveMeasurements
  
    @available(*, deprecated, renamed: "disableBackgroundWork")
    static let D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_BACKGROUND_WORK = Self.disableBackgroundWork

    @available(*, deprecated, renamed: "disableProfilingBySystem")
    static let D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_PROFILING_BY_SYSTEM = Self.disableProfilingBySystem
}

#endif
