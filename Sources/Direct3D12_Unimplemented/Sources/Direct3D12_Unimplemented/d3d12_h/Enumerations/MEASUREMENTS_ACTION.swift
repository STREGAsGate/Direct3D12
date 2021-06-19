/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify what should be done with the results of earlier workload instrumentation.
@available(Windows, introduced: 10.0.18362)
public enum MeasurmentsAction {
    public typealias RawValue = WinSDK.D3D12_MEASUREMENTS_ACTION
    ///	The default setting. Specifies that all results should be kept.
    case keepAll
    ///	Specifies that the driver has seen all the data that it's ever going to, so it should stop waiting for more and go ahead compiling optimized shaders.
    case commitResults
    ///	Like D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS, but also specifies that your application doesn't care about glitches, so the runtime should ignore the usual idle priority rules and go ahead using as many threads as possible to get shader recompiles done fast. Available only in Developer mode.
    case commitResultsHighPriority
    ///	Specifies that the optimization state should be reset; hinting that whatever has previously been measured no longer applies.
    case discardPrevious

    public var rawValue: RawValue {
        switch self {
        case .keepAll:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_KEEP_ALL
        case .commitResults:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS
        case .commitResultsHighPriority:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY
        case .discardPrevious:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "MeasurmentsAction")
public typealias D3D12_MEASUREMENTS_ACTION = MeasurmentsAction

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "keepAll")
let D3D12_MEASUREMENTS_ACTION_KEEP_ALL = MeasurmentsAction.keepAll

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "commitResults")
let D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS = MeasurmentsAction.commitResults

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "commitResultsHighPriority")
let D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY = MeasurmentsAction.commitResultsHighPriority

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "discardPrevious")
let D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS = MeasurmentsAction.discardPrevious


#endif
